//
//  NutritionTabModel.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 21/01/25.
//

import Foundation

enum Tab: String, CaseIterable {
    case home = "Home"
    case logs = "Logs"
    case scan = "Scan"
    case streaks = "Streaks"
    case profile = "Profile"
    
    var imageName: String {
        switch self {
        case .home: return "home"
        case .logs: return "logs"
        case .scan: return "Scan Button"
        case .streaks: return "streaks"
        case .profile: return "profile"
        }
    }
}
