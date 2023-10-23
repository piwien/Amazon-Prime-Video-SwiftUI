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
    let movie: MovieResults?
    let series: SeriesResults?
    let toprated: TopRated.TopRatedResults?
    
    let movieurl = URL(string: "https://m.media-amazon.com/images/S/pv-target-images/e7317d239c44c58c3c8638cb5049e0828f5237c2169e23eb1ce10c990bb415a7.jpg")
    
    init(movie: MovieResults? = nil, series: SeriesResults? = nil, toprated: TopRated.TopRatedResults? = nil) {
        self.movie = movie
        self.series = series
        self.toprated = toprated
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
                        AsyncImage(url: movie?.backdropURL ?? series?.backdropURL ?? toprated?.backdropURL) { phase in
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
                        Text((movie?.title ?? series?.name ?? toprated?.title)!)
                            .font(.title)
                            .bold()

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
//                        Text((movie?.overview ?? series?.overview ?? toprated?.overview)!)
                        Text(limitText((movie?.overview ?? series?.overview ?? toprated?.overview)!, maxLength:150))
                       
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
                                CastView(cast: cast)
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
            }
            await model.loadMoviesCastProfiles()
            await model.loadSeriesCastProfiles()
        }

    }
}

func limitText(_ text: String, maxLength: Int) -> String {
    if text.count > maxLength {
        let index = text.index(text.startIndex, offsetBy: maxLength)
        return text[..<index] + "..."
    }
    return text
}

#Preview {
    ContentDetailView()
}
