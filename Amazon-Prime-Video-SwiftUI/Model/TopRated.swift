//
//  TopRated.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 23.10.2023.
//

import Foundation

struct TopRated: Decodable {
    let results: [TopRatedResults]
    
    struct TopRatedResults: Identifiable, Decodable {
        let id: Int
        let backdrop_path: String?
        let overview: String
        let poster_path: String?
        let release_date: String
        let title: String
        let vote_average: Float
        let vote_count: Int
        
        var poster: URL? {
            let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")
            return baseURL?.appending(path: poster_path ?? "")
        }
        
        var backdropURL: URL? {
            let baseURL = URL(string: "https://image.tmdb.org/t/p/w500/")
            return baseURL?.appending(path: backdrop_path ?? "")
        }
    }
}
