//
//  NutritionResultsView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 17/01/25.
//

import SwiftUI

struct NutritionResultsPageView: View {
    @StateObject private var viewModel = NutritionResultsViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Top Image Section
                    ZStack(alignment: .bottom) {
                        Image(viewModel.nutritionResult.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .clipped()
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, .white]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(height: 80)
                    }

                    // Food Name Section
                    VStack(spacing: 8) {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 90, height: 50)
                            .overlay(Text("Food").padding(20).font(.footnote).bold())
                            .padding(.leading, -100)

                        Text(viewModel.nutritionResult.name)
                            .font(.title2)
                            .bold()
                    }
                    .padding(.top, -50)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    // Nutritional Overview Section
                    NutrientValueGroup(nutritionResult: viewModel.nutritionResult)

                    // Weekly Meal Chart
                    SectionHeader(title: "Weekly Meal Nutrition")
                    WeeklyMealNutrientChartView(data: viewModel.weeklyMealData)
                        .frame(height: 200)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)

                    // Save Button
                    Button(action: viewModel.saveToDailyLog) {
                        Text("Save to Daily Log")
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#E29523"))
                            .cornerRadius(10)
                    }
                    .alert("Saved to Daily Log!", isPresented: $viewModel.showAlert) {
                        Button("OK", role: .cancel) { }
                    }

                    // Premium Upgrade Section
                    HStack {
                        Text("Want more Insights?")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("Upgrade to Premium")
                            .font(.subheadline)
                            .underline()
                            .foregroundColor(.black)
                            .onTapGesture {
                                viewModel.showPremiumUpgrade()
                            }
                    }
                    .alert("Upgrade to Premium for more insights!", isPresented: $viewModel.showPremiumAlert) {
                        Button("OK", role: .cancel) { }
                    }
                }
                .padding()
            }
            .navigationTitle("Nutrition Results")
            .navigationBarTitleDisplayMode(.inline)
            
            .navigationBarItems(leading: Button(action: {
                viewModel.isInActive = true
            }) {
                Image("keyboard_arrow_left")
            })
            .navigate(to: ContentView(), when: $viewModel.isInActive)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct NutritionResultsView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionResultsPageView()
    }
}
