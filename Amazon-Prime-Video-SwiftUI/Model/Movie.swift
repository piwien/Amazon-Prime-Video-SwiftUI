//
//  Movie.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 22.10.2023.
//

import Foundation


struct Movie: Decodable {
    let page: Int
    let results: [MovieResults]
    let total_pages: Int
    let total_results: Int
}
