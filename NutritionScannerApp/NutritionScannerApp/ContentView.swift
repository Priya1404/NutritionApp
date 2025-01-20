//
//  ContentView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 17/01/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Label("Home", image: "home")
                }
            
            LogsPageView()
                .tabItem {
                    Label("Logs", image: "logs")
                }

            FoodScanningPageView()
                .tabItem {
                    Image("Scan Button")
                }
                .toolbar(.hidden, for: .tabBar)

            StreaksPageView()
                .tabItem {
                    Label("Streaks", image: "streaks")
                }
            
            ProfilePageView()
                .tabItem {
                    Label("Profile", image: "profile")
                }
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle()) 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
