//
//  HomePageView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 20/01/25.
//

import SwiftUI

struct HomePageView: View {
    @StateObject private var viewModel = HomePageViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Greeting Card
                    GreetingCardView(userProfile: viewModel.userProfile)
                    
                    // Quick Access Cards
                    ForEach(viewModel.quickAccessCards, id: \.title) { card in
                        QuickAccessCardView(card: card)
                    }
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image("nutrak_logo")
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
