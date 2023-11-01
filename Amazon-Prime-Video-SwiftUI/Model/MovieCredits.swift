//
//  MovieCredits.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 23.10.2023.
//

import Foundation

struct MovieCredits: Decodable {
    let id: Int
    let cast: [Cast]
    
    struct Cast: Decodable, Identifiable {
        let name: String
        let id: Int
        let character: String?
        let order: Int
        let profile_path: String?
    }
}
