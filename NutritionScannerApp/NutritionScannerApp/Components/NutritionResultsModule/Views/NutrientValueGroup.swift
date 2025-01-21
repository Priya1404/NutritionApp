//
//  NutrientValueGroup.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 20/01/25.
//

import SwiftUI

struct NutrientValueGroup: View {
    let nutritionResult: NutritionResult
    
    var macroNutrientsTotal: Int {
            nutritionResult.macronutrients
                .compactMap { Int($0.value.components(separatedBy: " ").first ?? "0") }
                .reduce(0, +)
        }

    var microNutrientsTotal: Int {
            nutritionResult.micronutrients
                .compactMap { Int($0.value.replacingOccurrences(of: "%", with: "")) }
                .reduce(0, +)
        }

    var body: some View {
        VStack {
            // Nutritional Overview
            SectionHeader(title: "Nutritional Overview")
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                NutrientCardView(
                    viewModel: NutrientCardViewModel(
                        nutrient: Nutrient(
                            imageName: "Calories",
                            title: "Calories",
                            value: nutritionResult.calories
                        )
                    )
                )
            }

            // Macronutrients
            SectionHeader(title: "Macronutrients", extraText: "Total: \(macroNutrientsTotal) g")
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                ForEach(nutritionResult.macronutrients, id: \.id) { nutrient in
                    NutrientCardView(viewModel: NutrientCardViewModel(nutrient: nutrient))
                }
            }

            // Micronutrients
            SectionHeader(title: "Micronutrients", extraText: "Total: \(microNutrientsTotal)%")
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                ForEach(nutritionResult.micronutrients, id: \.id) { nutrient in
                    NutrientCardView(viewModel: NutrientCardViewModel(nutrient: nutrient))
                }
            }
        }
    }
}

