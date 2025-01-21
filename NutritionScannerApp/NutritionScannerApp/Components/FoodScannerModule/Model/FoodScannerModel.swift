//
//  FoodScannerModel.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 21/01/25.
//

import Foundation
import SwiftUI

struct ScanningState {
    var isCameraAccessGranted: Bool = false
    var zoomLevel: CGFloat = 1.0
    var selectedImage: UIImage? = nil
    var showGallery: Bool = false
    var showNutritionResults: Bool = false
    var showAlert: Bool = true
}
