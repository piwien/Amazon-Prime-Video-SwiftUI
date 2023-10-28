//
//  SearchView.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 27.10.2023.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = HomePageViewModel()
    @State var searchtext = ""
    var body: some View {
        NavigationView{
            
            if searchtext.isEmpty {
                ZStack(alignment: .top) {
                    Color.black
                    VStack(spacing: 15) {
                        HStack{
                            //prime logo
                            Text("Find")
                                .font(.title)
                                .foregroundStyle(.white)
                                .fontWeight(.heavy)
                            Spacer()
                            //share tv icon
                            Image(systemName: "tv.badge.wifi")
                                .resizable()
                                .frame(width: 30, height: 25)
                            Spacer().frame(width: 20)
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                            //user profile
                        }
                        .padding(.horizontal)
                        HStack(spacing: 0) {
                            Button {
                                // Your action here
                            } label: {
                                Image(systemName: "magnifyingglass")
                                    .background(.white)
                                    .foregroundStyle(.gray)
                            }.padding(.horizontal, 7)
                            TextField("Type", text: $searchtext)
                                .padding(.vertical)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .colorScheme(.light)
                                .textFieldStyle(PlainTextFieldStyle()) // Apply PlainTextFieldStyle
                                .multilineTextAlignment(.leading) // Align text to the left
                        }
                        .background(.white)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        HStack {
                            Text("Genres")
                                .font(.title2)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        VStack(spacing: 15) {
                            HStack(spacing: 15) {
                                Button(action: {
                                    // Action for "Action and adventure" button
                                }) {
                                    Text("Action and\nadventure")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 60)
                                        .background(Color(red: 51 / 255, green: 54 / 255, blue: 61 / 255))
                                        .cornerRadius(10)
                                        .bold()
                                }
                                
                                Button(action: {
                                    // Action for "Comedy" button
                                }) {
                                    Text("Comedy")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 60)
                                        .background(Color(red: 51 / 255, green: 54 / 255, blue: 61 / 255))
                                        .cornerRadius(10)
                                        .bold()
                                }
                            }.padding(.horizontal)
                            
                            HStack(spacing: 10) {
                                Button(action: {
                                    // Action for "Action and adventure" button
                                }) {
                                    Text("Documentary")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 60)
                                        .background(Color(red: 51 / 255, green: 54 / 255, blue: 61 / 255))
                                        .cornerRadius(10)
                                        .bold()
                                }
                                
                                Button(action: {
                                    // Action for "Comedy" button
                                }) {
                                    Text("Drama")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 60)
                                        .background(Color(red: 51 / 255, green: 54 / 255, blue: 61 / 255))
                                        .cornerRadius(10)
                                        .bold()
                                }
                            }.padding(.horizontal)
                            
                            HStack(spacing: 10) {
                                Button(action: {
                                    // Action for "Action and adventure" button
                                }) {
                                    Text("Fantasy")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 60)
                                        .background(Color(red: 51 / 255, green: 54 / 255, blue: 61 / 255))
                                        .cornerRadius(10)
                                        .bold()
                                }
                                
                                Button(action: {
                                    // Action for "Comedy" button
                                }) {
                                    Text("Horror")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 60)
                                        .background(Color(red: 51 / 255, green: 54 / 255, blue: 61 / 255))
                                        .cornerRadius(10)
                                        .bold()
                                }
                            }.padding(.horizontal)
                            
                            HStack(spacing: 10) {
                                Button(action: {
                                    // Action for "Action and adventure" button
                                }) {
                                    Text("Kids")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 60)
                                        .background(Color(red: 51 / 255, green: 54 / 255, blue: 61 / 255))
                                        .cornerRadius(10)
                                        .bold()
                                }
                                
                                Button(action: {
                                    // Action for "Comedy" button
                                }) {
                                    Text("Mystery and\nthrillers")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 60)
                                        .background(Color(red: 51 / 255, green: 54 / 255, blue: 61 / 255))
                                        .cornerRadius(10)
                                        .bold()
                                }
                            }.padding(.horizontal)
                            
                            HStack(spacing: 10) {
                                Button(action: {
                                    // Action for "Action and adventure" button
                                }) {
                                    Text("Romance")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 60)
                                        .background(Color(red: 51 / 255, green: 54 / 255, blue: 61 / 255))
                                        .cornerRadius(10)
                                        .bold()
                                }
                                
                                Button(action: {
                                    // Action for "Comedy" button
                                }) {
                                    Text("Science fiction")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 60)
                                        .background(Color(red: 51 / 255, green: 54 / 255, blue: 61 / 255))
                                        .cornerRadius(10)
                                        .bold()
                                }
                            }.padding(.horizontal)
                            
                        }
                        
                    }
                }
                
            } else {
                ZStack(alignment: .top) {
                    Color.black
                    VStack(spacing: 15) {
                        HStack{
                            //back button
                            Button {
                                searchtext = ""
                            } label: {
                                Image(systemName: "chevron.left")
                                    .font(.title2)
                                    .fontWeight(.heavy)
                            }
                            Spacer()
                            //share tv icon
                            Image(systemName: "tv.badge.wifi")
                                .resizable()
                                .frame(width: 30, height: 25)
                            Spacer().frame(width: 20)
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                            //user profile
                        }
                        .padding(.horizontal)
                        HStack(spacing: 0) {
                            Button {
                                // Your action here
                            } label: {
                                Image(systemName: "magnifyingglass")
                                    .background(.white)
                                    .foregroundStyle(.gray)
                            }.padding(.horizontal, 7)
                            TextField("Type", text: $searchtext)
                                .padding(.vertical)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .colorScheme(.light)
                                .textFieldStyle(PlainTextFieldStyle()) // Apply PlainTextFieldStyle
                                .multilineTextAlignment(.leading) // Align text to the left
                        }
                        .background(.white)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            ForEach(viewModel.searchResults) { item in
                                SearchCard(searchitems: item)
                            }
                        }
                        
                        
                    }
                }
            }
        }
        .onChange(of: searchtext) { newValue in
            viewModel.searchMulti(term: newValue)
        }
    }
}

#Preview {
    SearchView()
}
