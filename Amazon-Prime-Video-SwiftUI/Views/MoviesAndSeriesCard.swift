//
//  MoviesAndSeriesCard.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 22.10.2023.
//

import SwiftUI

struct MoviesAndSeriesCard: View {
    
    let seriesitems: SeriesResults?
    let movieitems: MovieResults?
    
    init(seriesitems: SeriesResults? = nil, movieitems: MovieResults? = nil) {
            self.seriesitems = seriesitems
            self.movieitems = movieitems
        }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: movieitems?.backdropURL ?? seriesitems?.backdropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 100)
                
                
            } placeholder: {
                Rectangle().fill(Color.gray)
                    .frame(width: 200, height: 100)
            }
        }.clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
