//
//  FlashButton.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 21/01/25.
//

import SwiftUI

struct FlashButton: View {
    var body: some View {
        Button {
            // Flash toggle action
        } label: {
            Image("Flash")
                .foregroundColor(.yellow)
        }
    }
}

struct FlashButton_Previews: PreviewProvider {
    static var previews: some View {
        FlashButton()
    }
}
