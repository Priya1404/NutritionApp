//
//  NutritionResultsModel.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 21/01/25.
//

import Foundation

struct NutritionResult: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let calories: String
    let macronutrients: [Nutrient]
    let micronutrients: [Nutrient]
}

struct Nutrient {
    let id = UUID() // Unique identifier for each Nutrient
    let imageName: String
    let title: String
    let value: String
}

struct WeeklyMealData {
    let day: Double
    let value: Double
}
