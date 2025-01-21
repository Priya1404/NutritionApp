//
//  HomeVM.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 21/01/25.
//

import Foundation

class HomePageViewModel: ObservableObject {
    @Published var userProfile: UserProfile
    @Published var quickAccessCards: [QuickAccessCard]
    
    init() {
        // Mock Data
        self.userProfile = UserProfile(
            profileImageURL: "https://picsum.photos/id/237/300/300",
            greeting: "Good Morning",
            subtitle: "Track nutrition, stay healthy"
        )
        
        self.quickAccessCards = [
            QuickAccessCard(
                imageName: "homescan",
                title: "Scan your food",
                subtitle: "Instantly analyze your meal’s nutrition by scanning it.",
                bgColor: "#C2E4C4"
            ),
            QuickAccessCard(
                imageName: "discover",
                title: "Discover Healthy Recipes",
                subtitle: "Find meals that fit your nutrition goals.",
                bgColor: "#FFDCA8"
            )
        ]
    }
}
