//
//  HomePageViewModel.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 22.10.2023.
//

import Foundation

@MainActor
class HomePageViewModel: ObservableObject {
    @Published var movies: [MovieResults] = []
    @Published var series: [SeriesResults] = []
    @Published var topRated: [TopRated.TopRatedResults] = []
    
    static let APIKEY = "8702cb80fa7566421a1e387b20658952"
    
    func loadNowPlayingMovies() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(HomePageViewModel.APIKEY)")!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let nplayingmovies = try JSONDecoder().decode(Movie.self, from: data)
                movies = nplayingmovies.results
            } catch{
                print("Loading Now Playing Movies Error: \(error.localizedDescription)")
            }
        }
    }
    
    func loadNowPlayingSeries() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/tv/on_the_air?api_key=\(HomePageViewModel.APIKEY)")!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let nplayingseries = try JSONDecoder().decode(Series.self, from: data)
                series = nplayingseries.results
            } catch{
                print("Loading Now Playing Series Error: \(error.localizedDescription)")
            }
        }
    }
    
    func loadTopRatedMovies() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=\(HomePageViewModel.APIKEY)")!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let topratedmovies = try JSONDecoder().decode(TopRated.self, from: data)
                topRated = topratedmovies.results
            } catch{
                print("Loading Top Rated Movies Error: \(error.localizedDescription)")
            }
        }
    }
}
