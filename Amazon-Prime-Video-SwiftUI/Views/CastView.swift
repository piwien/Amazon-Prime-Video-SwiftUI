//
//  CastView.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 23.10.2023.
//

import Foundation
import SwiftUI


struct CastView: View {
    
    let cast: CastProfile
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: cast.photoUrl) { image in
                image
                    .resizable()
                    .frame(width: 110, height: 150)
                    .scaledToFill()
            } placeholder: {
                ProgressView()
                    .frame(width: 110, height: 150)
            }
            
            LinearGradient(
                gradient: Gradient(
                    stops: [
                        .init(color: Color.black.opacity(0.0), location: 0),
                        .init(color: Color.black.opacity(0.8), location: 0.7),
                        .init(color: Color.black.opacity(0.9), location: 1)
                    ]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 50)
            
                Text(cast.name)
                    .lineLimit(2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                    .frame(width: 100)
                    .padding(.vertical, 5)
                    .multilineTextAlignment(.center)
            
            
        }
        .frame(width: 110, height: 150)
        .clipShape(RoundedRectangle(cornerRadius: 10))

    }
}

#Preview {
    CastView(cast: .init(birthday: "", id: 1, name: "Berkay Caprio", profile_path: "/mclHxMm8aPlCPKptP67257F5GPo.jpg", biography: "", known_for_department: "", place_of_birth: ""))
}
