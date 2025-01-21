//
//  NutrientCardView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 20/01/25.
//

import SwiftUI

struct NutrientCardView: View {
    let viewModel: NutrientCardViewModel

    var body: some View {
        HStack {
            Image(viewModel.imageName)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.horizontal, 5)
            
            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(viewModel.value)
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
