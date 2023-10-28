//
//  SearchCard.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 28.10.2023.
//

import SwiftUI

struct SearchCard: View {
    let searchitems: SearchModel.SearchResults?
    var body: some View {
        ZStack {
            Color.black
            HStack {
                AsyncImage(url: searchitems?.backdropURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }  placeholder: {
                    Rectangle().fill(Color.gray)
                        .frame(width: 180, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                
                VStack(spacing: 10) {
                    Text(limitTitle(searchitems?.title) ?? limitTitle(searchitems?.name) ?? "No title")
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.center)
                    Text(searchitems?.release_date ?? searchitems?.first_air_date ?? "Empty Data!")
                        .font(.caption)
                    
                }.frame(maxWidth: .infinity)
            }.padding(.horizontal)
        }
    }
}

func limitTitle(_ title: String?) -> String? {
    if let title = title {
        if title.count > 30 {
            return String(title.prefix(30)) + "..."
        }
        return title
    }
    return nil
}

#Preview {
    SearchCard(searchitems: .init(adult: false, backdrop_path: "", id: 1, title: "", original_language: "", overview: "", first_air_date: "23.05.2024", name: "Loki", poster_path: "", release_date: "", vote_average: 3.4, vote_count: 44))
}
