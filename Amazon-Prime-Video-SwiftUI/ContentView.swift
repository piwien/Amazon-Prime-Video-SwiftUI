//
//  ContentView.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 22.10.2023.
//

import SwiftUI

struct ContentView: View {
    let images: [URL] = [URL(string: "https://m.media-amazon.com/images/S/pv-target-images/e7317d239c44c58c3c8638cb5049e0828f5237c2169e23eb1ce10c990bb415a7.jpg")!, URL(string: "https://m.media-amazon.com/images/S/pv-target-images/51ef07efaad9b9f9b7c83442ca3de3942d256afd2d0076bcc383622f59b77830._UR1920,1080_.jpg")!, URL(string: "https://m.media-amazon.com/images/S/pv-target-images/e379a05d55895506c61248af811a244b3a516ae391e92cc3e2a4106ed703ab26.jpg")!,URL(string: "https://m.media-amazon.com/images/S/sonata-images-prod/US_SVOD_Gen_V_S1/9a18c111-af04-4bd6-b88e-1fd2a20123af._UR1920,1080_.jpeg")!,URL(string: "https://m.media-amazon.com/images/S/pv-target-images/798a3db43ab5d9cf497c152db40d4ffbcce5326c93be4efa5387689fafa81123.jpg")!,URL(string: "https://m.media-amazon.com/images/S/pv-target-images/ec9d6886c0b4e0d61b6312e29ff9c33d191cf51a4db263db968cbd53ab7d3d70.jpg")!,URL(string: "https://m.media-amazon.com/images/S/pv-target-images/1e43164de90d195e1252e278c5a420f568e11b1018099e92d42892330d6d5c34.jpg")!,URL(string: "https://images.alphacoders.com/130/1301451.jpg")!,URL(string: "https://m.media-amazon.com/images/S/pv-target-images/2755192ac73b7b4a52f50e3297813231e2dd086b9b090a17d6b72722717e05d9._UR1920,1080_.jpg")!,URL(string: "https://m.media-amazon.com/images/S/pv-target-images/e7e2dc86095199845268211dc4e85c1dd6f13b07adfa80b7a513a4bcac4d9bbf.jpg")!]
    var body: some View {
        ZStack {
            Color.black
            VStack {
                HStack{
                    //prime logo
                    //Spacer()
                    //share tv icon
                    //user profile
                }
                VStack{
                    //slider
                    ImageSliderView(imageUrls: images)
                }
                VStack {
                    // Prime TV Series
                }
                VStack {
                    // Prime Movies
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        
    }
}



#Preview {
    ContentView()
}
