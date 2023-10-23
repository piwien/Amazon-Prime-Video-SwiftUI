//
//  PosterCard.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 23.10.2023.
//

import Foundation
import SwiftUI


struct PosterCard: View {
    
    let topRatedResults: TopRated.TopRatedResults?
    
    init(topRatedResults: TopRated.TopRatedResults? = nil) {
        self.topRatedResults = topRatedResults
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {

            AsyncImage(url: topRatedResults?.poster) { poster in
                poster
                    .resizable()
                    .frame(width: 130, height: 200)
                    .scaledToFill()
            } placeholder: {
                ProgressView()
                    .frame(width: 130, height: 150)
            }
        }
        .frame(width: 130, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 10))

    }
}

#Preview {
    PosterCard()
}
