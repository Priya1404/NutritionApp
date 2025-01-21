//
//  MilestoneVM.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 21/01/25.
//

import Foundation

class MilestoneViewModel: ObservableObject {
    let milestoneColors = ["#EBEDF0", "#FFF8F0", "#E6F3FA", "#EDE6FA"]
    let streakMilestones = ["7", "10", "20", "30"]
    let milestoneIcons = ["Silver", "Bronze", "Gold", "Platinum"]
    let isMilestoneAchieved: [Bool] = [true, false, false, false] // Mock data for milestone achievement
}
