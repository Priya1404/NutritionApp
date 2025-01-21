//
//  StreaksVM.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 21/01/25.
//

import Foundation

class StreaksPageViewModel: ObservableObject {
    @Published var showShareSheet = false
    @Published var streakNumber = 5 // Mock data for streak count
}
