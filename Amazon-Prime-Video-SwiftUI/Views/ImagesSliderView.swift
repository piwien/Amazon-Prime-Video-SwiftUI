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
                                .scaledToFill()
                                .frame(maxWidth: .infinity, maxHeight: 200)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        
        
    }
}

struct ImageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSliderView(imageUrls: [URL(string: "https://wallpapers.com/images/featured/euphoria-uhve7e9ctiftdcmw.webp")!, URL(string: "https://wallpapers.com/images/featured/euphoria-uhve7e9ctiftdcmw.webp")!]) // Replace with your image URLs
    }
}
