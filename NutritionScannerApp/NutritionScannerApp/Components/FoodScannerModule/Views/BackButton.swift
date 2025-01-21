//
//  BackButton.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 21/01/25.
//

import SwiftUI

struct BackButton: View {
    @Binding var isInactive: Bool

    var body: some View {
        Button {
            isInactive = true
        } label: {
            Image("keyboard_arrow_left")
        }
    }
}
