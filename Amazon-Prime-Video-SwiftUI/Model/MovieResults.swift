//
//  MovieResults.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 22.10.2023.
//

import Foundation

struct MovieResults: Identifiable, Decodable {
    let id: Int
    let backdrop_path: String?
    let overview: String
    let poster_path: String?
    let release_date: String
    let title: String
    let vote_average: Float
    let vote_count: Int
    
    var backdropURL: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500/")
        return baseURL?.appending(path: backdrop_path ?? "")
    }
    
    var posterThumbURL: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w100/")
        return baseURL?.appending(path: poster_path ?? "")
    }
    
    var poster: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500/")
        return baseURL?.appending(path: poster_path ?? "")
    }
}
