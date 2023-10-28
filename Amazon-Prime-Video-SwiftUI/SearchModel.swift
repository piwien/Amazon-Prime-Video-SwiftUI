//
//  SearchModel.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 27.10.2023.
//

import Foundation


struct SearchModel: Decodable {
    let page: Int
    let results: [SearchResults]
    let total_pages: Int
    let total_results: Int
    
    struct SearchResults: Identifiable, Decodable {
        let adult: Bool?
        let backdrop_path: String?
        let id: Int
        let title: String?
        let original_language: String?
        let overview: String?
        let first_air_date: String?
        let name: String?
        let poster_path: String?
        let release_date: String?
        let vote_average: Float?
        let vote_count: Int?
        
        var backdropURL: URL? {
            let baseURL = URL(string: "https://image.tmdb.org/t/p/w500/")
            return baseURL?.appending(path: backdrop_path ?? "")
        }
    }
}
