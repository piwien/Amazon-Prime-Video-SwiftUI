//
//  SeriesResults.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 23.10.2023.
//

import Foundation

struct SeriesResults: Identifiable, Decodable {
    let id: Int
    let backdrop_path: String?
    let overview: String
    let poster_path: String?
    let first_air_date: String
    let name: String
    let vote_average: Float
    let vote_count: Int
    let popularity: Float
    
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
