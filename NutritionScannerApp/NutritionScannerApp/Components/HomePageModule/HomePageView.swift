//
//  HomePageView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 20/01/25.
//

import SwiftUI

struct HomePageView: View {
    //Mock Data
    private var userProfileImage: String = "https://picsum.photos/id/237/300/300"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Greeting Card
                    HStack {
                        AsyncImage(url: URL(string: userProfileImage)){ result in
                                    result.image?
                                        .resizable()
                                        .scaledToFill()
                                }
                                .frame(width: 80, height: 80)
                            
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Good Morning")
                                .font(.title)
                                .bold()
                            Text("Track nutrition, stay healthy")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    
                    // Quick Access Cards
                    VStack(spacing: 20) {
                        QuickAccessCardView(imageName: "homescan", title: "Scan your food", subTitle: "Instantly analyze your meal’s nutrition by scanning it.")
                            .background(Color(hex: "#C2E4C4"))
                        QuickAccessCardView(imageName: "discover", title: "Discover Healthy Recipes", subTitle: "Find meals that fit your nutrition goals.")
                            .background(Color(hex: "#FFDCA8"))
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
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
