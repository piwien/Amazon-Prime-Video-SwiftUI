//
//  ImagesSliderView.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 22.10.2023.
//

import SwiftUI

struct ImageSliderView: View {
    let imageUrls: [URL] // Replace with your image URL data source

    var body: some View {
            TabView {
                ForEach(imageUrls, id: \.self) { imageUrl in
                    AsyncImage(url: imageUrl) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                
                            Spacer()
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 270)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct ImageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSliderView(imageUrls: [URL(string: "https://m.media-amazon.com/images/S/pv-target-images/e7317d239c44c58c3c8638cb5049e0828f5237c2169e23eb1ce10c990bb415a7.jpg")!, URL(string: "https://wallpapers.com/images/featured/euphoria-uhve7e9ctiftdcmw.webp")!]) // Replace with your image URLs
    }
}
