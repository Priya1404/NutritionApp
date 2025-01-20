//
//  NutritionResultsView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 17/01/25.
//

import SwiftUI
import DGCharts

struct NutritionResultsPageView: View {
    @State private var showAlert = false
    @State private var showPremiumAlert = false
    @State private var isInActive = false

    var body: some View {
            NavigationView {
                ScrollView {
                    VStack(spacing: 20) {
                        
                        // Top Pizza Image with Blurred Ends
                        ZStack(alignment: .bottom) {
                            Image("PepporoniPizza")
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

                            Text("Pepperoni Pizza")
                                .font(.title2)
                                .bold()
                        }
                        .padding(.top, -50)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // Nutritional Overview Section
                        Group {
                            NutrientValueGroup()
                            
                            //  Weekly Meal Nutrition Section
                            SectionHeader(title: "Weekly Meal Nutrition")
                            WeeklyMealNutrientChartView()
                                .frame(height: 200)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(20)
                        }
                                                
                        // Save to Daily Log Button
                        Button(action: {
                            showAlert = true
                        }) {
                            Text("Save to Daily Log")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(.clear)

                        }
                        .background(Color(hex: "#E29523"))
                        .cornerRadius(10)
                        .alert("Saved to Daily Log!", isPresented: $showAlert) {
                            Button("OK", role: .cancel) { }
                        }
                        
                        // Upgrade to Premium Text
                        HStack {
                            Text("Want more Insights?")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text("Upgrade to Premium")
                                .font(.subheadline)
                                .underline()
                                .foregroundColor(.black)
                                .onTapGesture {
                                    showPremiumAlert = true
                                }
                        }
                        .alert("Upgrade to Premium for more insights!", isPresented: $showPremiumAlert) {
                            Button("OK", role: .cancel) { }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Nutrition Results")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Button(action: {
                    self.isInActive = true
                }) {
                    Image("keyboard_arrow_left")
                })
                .navigate(to: ContentView(), when: $isInActive)
            }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct NutritionResultsView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionResultsPageView()
    }
}
