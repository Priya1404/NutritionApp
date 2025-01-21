//
//  BadgeView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 17/01/25.
//

import SwiftUI

struct BadgeView: View {
    var body: some View {
        HStack {
            Image("Bronze")
                .resizable()
                .frame(width: 15, height: 15)
            Text("10-day streak achiever")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(width: 170, height: 20)
        .padding(.bottom, 1)
        .background(Color(hex: "#FFF8F0"))
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray, lineWidth: 0.5)
        )
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
