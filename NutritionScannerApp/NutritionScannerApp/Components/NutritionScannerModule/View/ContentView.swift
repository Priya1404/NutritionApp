//
//  ContentView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 17/01/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TabViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            HomePageView()
                .tabItem {
                    Label(Tab.home.rawValue, image: Tab.home.imageName)
                }
                .tag(Tab.home)
            
            LogsPageView()
                .tabItem {
                    Label(Tab.logs.rawValue, image: Tab.logs.imageName)
                }
                .tag(Tab.logs)

            FoodScanningPageView()
                .tabItem {
                    Image(Tab.scan.imageName)
                }
                .toolbar(.hidden, for: .tabBar)
                .tag(Tab.scan)

            StreaksPageView()
                .tabItem {
                    Label(Tab.streaks.rawValue, image: Tab.streaks.imageName)
                }
                .tag(Tab.streaks)
            
            ProfilePageView()
                .tabItem {
                    Label(Tab.profile.rawValue, image: Tab.profile.imageName)
                }
                .tag(Tab.profile)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
