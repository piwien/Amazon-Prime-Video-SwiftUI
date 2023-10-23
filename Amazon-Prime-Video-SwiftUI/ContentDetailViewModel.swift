//
//  ContentDetailViewModel.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 23.10.2023.
//

import Foundation
import SwiftUI

@MainActor
class ContentDetailViewModel: ObservableObject {
    
    @Published var movieCredits: MovieCredits?
    @Published var cast: [MovieCredits.Cast] = []
    @Published var castProfiles: [CastProfile] = []
    @Published var seriesCredits: SeriesCredits?
    @Published var seriescast: [SeriesCredits.Cast] = []
    
    func movieCredits(for movieid: Int) async {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieid)/credits?api_key=\(HomePageViewModel.APIKEY)&language=en-US")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let credits = try JSONDecoder().decode(MovieCredits.self, from: data)
            self.movieCredits = credits
            self.cast = credits.cast /*.sorted(by: { $0.order < $1.order })*/
        } catch {
            print("Error movie credits data:", error.localizedDescription) // Hata mesajını yazdır
        }
    }
    
    func seriesCredits(for seriesid: Int) async {
        let url = URL(string: "https://api.themoviedb.org/3/tv/\(seriesid)/credits?api_key=\(HomePageViewModel.APIKEY)&language=en-US")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let credits = try JSONDecoder().decode(SeriesCredits.self, from: data)
            self.seriesCredits = credits
            self.seriescast = credits.cast /*.sorted(by: { $0.order < $1.order })*/
        } catch {
            print("Error Series credits data:", error.localizedDescription) // Hata mesajını yazdır
        }
    }
    
    func loadCastProfiles() async {
        do {
            for member in cast {
                let url = URL(string: "https://api.themoviedb.org/3/person/\(member.id)?api_key=\(HomePageViewModel.APIKEY)&language=en-US")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let profile = try JSONDecoder().decode(CastProfile.self, from: data)
                print(profile)
                castProfiles.append(profile)
            }
        } catch {
            print("Error cast profile data:", error.localizedDescription) // Hata mesajını yazdır
        }
    }
}




