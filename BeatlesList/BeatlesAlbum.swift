//
//  BeatlesAlbum.swift
//  BeatlesList
//
//  Created by Adriano Rodrigues Vieira on 26/03/21.
//

import Foundation

struct BeatlesAlbumData: Decodable {
    let albumName: String
    let releaseDate: String
    let trackCount: Int
    
    enum CodingKeys: String, CodingKey {
        case albumName
        case releaseDate
        case trackCount        
    }
}

struct BeatlesAlbum: Hashable {
    let albumName: String
    let releaseDate: String
    let trackCount: Int
    
    init(from data: BeatlesAlbumData) {
        self.albumName = data.albumName
        self.releaseDate = data.releaseDate
        self.trackCount = data.trackCount
    }
        
}
