//
//  QuickAccessCardView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 20/01/25.
//

import SwiftUI

struct QuickAccessCardView: View {
    let imageName: String
    let title: String
    let subTitle: String

    var body: some View {
        HStack {
            VStack{
                Text(title)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                Text(subTitle)
                    .font(.body)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
            Image(imageName)
                .resizable()
                .frame(width: 50, height: 50)
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct QuickAccessCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuickAccessCardView(imageName: "homescan", title: "Scan your food", subTitle: "Instantly analyze your meal’s nutrition by scanning it.")
    }
}
