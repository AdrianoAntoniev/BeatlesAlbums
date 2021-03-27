//
//  ContentView.swift
//  BeatlesList
//
//  Created by Adriano Rodrigues Vieira on 26/03/21.
//

import SwiftUI

struct ContentView: View {
    @State private var beatlesAlbums: [BeatlesAlbum] = []
    
    var body: some View {
        VStack {
            List {
                ForEach(beatlesAlbums, id: \.self) { beatlesAlbum in
                    Text(beatlesAlbum.albumName)
                }
            }
        }.onAppear {
            if let url = URL(string: "https://the-beatles-api.herokuapp.com/api/v1/albums") {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        do {
                            let dataArray = try JSONDecoder().decode([BeatlesAlbumData].self, from: data)
                            
                            for dataItem in dataArray {
                                let beatlesAlbum = BeatlesAlbum(from: dataItem)
                                
                                DispatchQueue.main.async {
                                    self.beatlesAlbums.append(beatlesAlbum)
                                }
                            }
                            
                            
                        } catch let error {
                            print(error)
                        }
                    }
                }.resume()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
