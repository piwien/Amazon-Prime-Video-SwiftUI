//
//  LoadingView.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 2.11.2023.
//

import SwiftUI

struct LoadingView: View {
    
    let primelogo = URL(string: "https://i.hizliresim.com/qs41pf5.png")
    
    var body: some View {
        ZStack(alignment: .center){
//            Color(.black)
            VStack(spacing: 30) {
                AsyncImage(url: primelogo) { phase in
                    switch phase {
                    case .empty:
                        Image(systemName: "photo")
                            .frame(width: 60, height: 20)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit().frame(maxWidth: 200)
                            
                    case .failure:
                        Image(systemName: "photo")
                            .frame(width: 60, height: 20)
                    @unknown default:
                        EmptyView()
                            .frame(width: 60, height: 20)
                    }
                }
                
                ProgressView()
                    .scaleEffect(2)
                    .frame(width: 50, height: 50)
                
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    LoadingView()
}
