//
//  Amazon_Prime_Video_SwiftUIApp.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 22.10.2023.
//

import SwiftUI

@main
struct Amazon_Prime_Video_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem { VStack{
                        Image(systemName: "house.fill")
                        Text("Downloads")
                    }  }
                Text("Welcome downloads section")
                    .tabItem { VStack{
                        Image(systemName: "tray.and.arrow.down")
                        Text("Downloads")
                    } }
                SearchView()
                    .tabItem { VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Find")
                    } }
            }.tint(.white)
        }
    }
}
