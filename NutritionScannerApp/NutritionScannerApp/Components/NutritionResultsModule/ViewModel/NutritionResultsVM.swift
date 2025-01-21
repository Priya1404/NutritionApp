//
//  NutritionResultsVM.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 21/01/25.
//

import Foundation

class NutritionResultsViewModel: ObservableObject {
    @Published var nutritionResult: NutritionResult
    @Published var showAlert: Bool = false
    @Published var showPremiumAlert: Bool = false
    @Published var isInActive: Bool = false
    @Published var weeklyMealData: [WeeklyMealData]

    init() {
        // Initialize with sample data
        self.nutritionResult = NutritionResult(
            name: "Pepperoni Pizza",
            imageName: "PepporoniPizza",
            calories: "320 kCal",
            macronutrients: [
                Nutrient(imageName: "Proteins", title: "Protein", value: "13 g"),
                Nutrient(imageName: "Carbs", title: "Carbs", value: "35 g"),
                Nutrient(imageName: "Fats", title: "Fats", value: "12 g")
            ],
            micronutrients: [
                Nutrient(imageName: "Vitamin A", title: "Iron", value: "10%"),
                Nutrient(imageName: "Calcium", title: "Calcium", value: "20%")
            ]
        )
        self.weeklyMealData = [
            WeeklyMealData(day: 1, value: 30),
            WeeklyMealData(day: 2, value: 50),
            WeeklyMealData(day: 3, value: 20),
            WeeklyMealData(day: 4, value: 40),
            WeeklyMealData(day: 5, value: 35),
            WeeklyMealData(day: 6, value: 25),
            WeeklyMealData(day: 7, value: 45)
        ]
    }

    func saveToDailyLog() {
        showAlert = true
    }

    func showPremiumUpgrade() {
        showPremiumAlert = true
    }
}
