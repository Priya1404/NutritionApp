//
//  NutrientValueGroup.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 20/01/25.
//

import SwiftUI

struct NutrientValueGroup: View {
    var body: some View {
        VStack{
            SectionHeader(title: "Nutritional Overview")
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                NutrientCardView(imageName: "Calories", title: "Calories", value: "320 kCal")
                    .frame(width: UIScreen.main.bounds.width/2 - 20)
            }
            
            
            // Macronutrients Section
            SectionHeader(title: "Macronutrients", extraText: "Total: 60 g")
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                NutrientCardView(imageName: "Proteins", title: "Protein", value: "13 g")
                NutrientCardView(imageName: "Carbs", title: "Carbs", value: "35 g")
                NutrientCardView(imageName: "Fats", title: "Fats", value: "12 g")
            }
            
            // Micronutrients Section
            SectionHeader(title: "Micronutrients", extraText: "Total: 30%")
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                NutrientCardView(imageName: "Vitamin A", title: "Iron", value: "10%")
                NutrientCardView(imageName: "Calcium", title: "Calcium", value: "20%")
            }
        }
    }
}

struct NutrientValueGroup_Previews: PreviewProvider {
    static var previews: some View {
        NutrientValueGroup()
    }
}
