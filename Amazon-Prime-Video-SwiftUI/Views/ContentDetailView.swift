//
//  ContentDetailView.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 23.10.2023.
//

import SwiftUI

struct ContentDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var model = ContentDetailViewModel()
    let searchitems: SearchModel.SearchResults?
    let movie: MovieResults?
    let series: SeriesResults?
    let toprated: TopRated.TopRatedResults?
    
    @State private var isExpanded = false
    let maxTextLength = 150
    
    init(movie: MovieResults? = nil, series: SeriesResults? = nil, toprated: TopRated.TopRatedResults? = nil, searchitems: SearchModel.SearchResults? = nil) {
        self.movie = movie
        self.series = series
        self.toprated = toprated
        self.searchitems = searchitems
    }
    var body: some View {
        ZStack {
            Color.black
            VStack(spacing: 15) {
                HStack{
                    //Back button
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                            .bold()
                    })
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
                }.padding(.horizontal)
                
                ScrollView {
                    VStack {
                        AsyncImage(url: movie?.backdropURL ?? series?.backdropURL ?? toprated?.backdropURL ?? searchitems?.backdropURL) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                    
                    HStack {
                        if let title = movie?.title ?? series?.name ?? toprated?.title ?? searchitems?.name ?? searchitems?.title {
                            Text(title)
                                .font(.title)
                                .bold()
                        } else {
                            // Handle the case where all values are nil
                            Text("No title available")
                        }
                        
                    }
                    HStack {
                        Button(action: {}, label: {
                            Text("How do I watch this?")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                                .frame(width: 350, height: 50)
                                .background(Color.gray, in: RoundedRectangle(cornerRadius: 10))
                            
                        })
                    }
                    Spacer().frame(height: 20)
                    HStack(spacing: 40) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            VStack(spacing: 10) {
                                Image(systemName: "play.tv")
                                    .resizable()
                                    .frame(width: 35, height: 30)
                                Text("Trailer").bold()
                            }
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            VStack{
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text("Watchlist").bold()
                            }
                            
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            VStack {
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .frame(width: 25, height: 30)
                                Text("Share").bold()
                            }
                        })
                    }.foregroundStyle(.white)
                    Spacer().frame(height: 20)
                    VStack {
                        Text(limitText((movie?.overview ?? series?.overview ?? toprated?.overview ?? searchitems?.overview)!, maxLength: isExpanded ? (movie?.overview ?? series?.overview ?? toprated?.overview ?? searchitems?.overview)!.count : maxTextLength))
                            .onTapGesture {
                                isExpanded.toggle()
                            }
                        //                        Text((movie?.overview ?? series?.overview ?? toprated?.overview)!)
                        //      version 1                  Text(limitText((movie?.overview ?? series?.overview ?? toprated?.overview)!, maxLength:150))
                        
                    }.padding(.horizontal)
                    HStack{
                        // Vote average
                        
                        
                        // Release Date
                    }
                    Spacer().frame(height: 20)
                    
                    HStack{
                        Text("Cast & Crew")
                            .fontWeight(.bold)
                            .font(.title3)
                        Spacer()
                        
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(model.castProfiles) { cast in
                                NavigationLink {
                                    PersonDetailView(cast: cast)
                                } label: {
                                    CastView(cast: cast)
                                }
                            }
                        }
                    }
                }
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarBackButtonHidden()
        .task {
            if let movieId = movie?.id {
                await model.movieCredits(for: movieId)
            } else if let seriesId = series?.id {
                await model.seriesCredits(for: seriesId)
            } else if let topratedID = toprated?.id {
                await model.movieCredits(for: topratedID)
            } else if ((searchitems?.title?.isEmpty) != nil) {
                await model.movieCredits(for: (searchitems?.id)!)
            } else {
                await model.seriesCredits(for: (searchitems?.id)!)
            }
            await model.loadMoviesCastProfiles()
            await model.loadSeriesCastProfiles()
        }
        
    }
}

//func limitText(_ text: String, maxLength: Int) -> String {
//        if text.count > maxLength {
//            return String(text.prefix(maxLength)) + "..."
//        }
//        return text
//    }  // version 1

func limitText(_ text: String, maxLength: Int) -> String {
    if text.count > maxLength {
        return String(text.prefix(maxLength)) + "..."
    }
    return text
}

#Preview {
    ContentDetailView()
}
