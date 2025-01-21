//
//  NutrientCardVM.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 21/01/25.
//

import Foundation

class NutrientCardViewModel: ObservableObject {
    let imageName: String
    let title: String
    let value: String

    init(nutrient: Nutrient) {
        self.imageName = nutrient.imageName
        self.title = nutrient.title
        self.value = nutrient.value
    }
}
