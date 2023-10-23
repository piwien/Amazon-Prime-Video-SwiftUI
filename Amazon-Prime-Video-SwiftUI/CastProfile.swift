//
//  CastProfile.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 23.10.2023.
//

import Foundation

struct CastProfile: Decodable, Identifiable {
    
    let birthday: String?
    let id: Int
    let name: String
    let profile_path: String?
    let biography: String?
    let known_for_department: String?
    let place_of_birth: String?
    
    var photoUrl: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w200/")
        return baseURL?.appending(path: profile_path ?? "")
    }
}
