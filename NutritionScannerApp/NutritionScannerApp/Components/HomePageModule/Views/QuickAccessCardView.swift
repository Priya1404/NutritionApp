//
//  QuickAccessCardView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 20/01/25.
//

import SwiftUI

struct QuickAccessCardView: View {
    let card: QuickAccessCard
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(card.title)
                    .font(.headline)
                Text(card.subtitle)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(card.imageName)
                .resizable()
                .frame(width: 50, height: 50)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background((card.bgColor != nil) ? Color(hex: card.bgColor!): Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}
