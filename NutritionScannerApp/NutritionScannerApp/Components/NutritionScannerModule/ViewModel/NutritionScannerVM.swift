//
//  NutritionScannerVM.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 21/01/25.
//

import Foundation
import SwiftUI

class TabViewModel: ObservableObject {
    @Published var selectedTab: Tab = .home
}
