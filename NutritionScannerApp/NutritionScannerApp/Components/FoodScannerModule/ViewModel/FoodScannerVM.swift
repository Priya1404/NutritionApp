//
//  FoodScannerVM.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 21/01/25.
//

import Foundation
import SwiftUI

class FoodScanningViewModel: ObservableObject {
    @Published var state = ScanningState()
    @Published var isInactive: Bool = false
    
    func handleCameraPermission(granted: Bool) {
        state.isCameraAccessGranted = granted
        if !granted {
            isInactive = true
        }
    }
    
    func toggleZoomLevel() {
        state.zoomLevel = state.zoomLevel == 1.0 ? 2.0 : 1.0
    }
    
    func selectImage(_ image: UIImage?) {
        state.selectedImage = image
        state.showNutritionResults = true
    }
}
