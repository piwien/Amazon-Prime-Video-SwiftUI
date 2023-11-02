//
//  UserView.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 2.11.2023.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.black
            
            VStack(spacing: 50) {
                
                Text("Who's watching?")
                    .bold()
                    .font(.title3)
                HStack(spacing: 70) {
                    NavigationLink {
                        ContentView()
                    } label: {
                        Button(action: {}, label: {
                            VStack(spacing: 15) {
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .foregroundStyle(.blue)
                                Text("Berkay")
                                    .bold()
                                    .foregroundStyle(.white)
                            }
                        })
                    }
                    
                    VStack(spacing: 15) {
                        Image(systemName: "face.smiling.inverse")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(.yellow)
                        Text("Kids")
                            .bold()
                    }
                }
                
                HStack {
                    VStack(spacing: 15) {
                        ZStack {
                            Color(red: 51 / 255, green: 54 / 255, blue: 61 / 255)
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 20, height: 20)
                                
                        }
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        
                        Text("New")
                            .bold()
                    }
                }
                
                Spacer()
                VStack(spacing: 10) {
                    Button(action: {}, label: {
                        Text("Edit Profiles")
                            .padding(.vertical,15)
                            .padding(.horizontal,130)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .colorScheme(.light)
                            
                            
                    }).clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: {}, label: {
                    Text("Learn more")
                        .foregroundStyle(.white)
                        .underline()
                })
                }
                   

            }.padding(.top, 20)
        }
    }
}

#Preview {
    UserView()
}
