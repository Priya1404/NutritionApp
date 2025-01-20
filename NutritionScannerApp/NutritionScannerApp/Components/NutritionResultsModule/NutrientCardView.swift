//
//  NutrientCardView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 20/01/25.
//

import SwiftUI

// Nutrient Card View
struct NutrientCardView: View {
    let imageName: String
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.horizontal, 5)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(value)
                    .font(.headline)
                    .bold()
            }
            .padding(10)
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct NutrientCardView_Previews: PreviewProvider {
    static var previews: some View {
        NutrientCardView(imageName: "Vitamin A", title: "Iron", value: "10%")
    }
}
