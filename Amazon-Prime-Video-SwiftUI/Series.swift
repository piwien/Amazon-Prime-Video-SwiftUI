//
//  Series.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 23.10.2023.
//

import Foundation

struct Series: Decodable {
    let page: Int
    let results: [SeriesResults]
    let total_pages: Int
    let total_results: Int
}
