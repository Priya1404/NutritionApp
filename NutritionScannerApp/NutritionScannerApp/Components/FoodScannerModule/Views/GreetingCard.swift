//
//  GreetingCard.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 21/01/25.
//

import SwiftUI

struct GreetingCard: View {
    var body: some View {
        HStack {
            Image("scan")
                .resizable()
                .frame(width: 40, height: 40)

            VStack(alignment: .leading) {
                Text("Scan your food")
                    .font(.headline)
                    .foregroundColor(.white)
                    .bold()
                Text("Ensure your food is well-lit and in focus for the most accurate scan.")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.white.blur(radius: 100, opaque: false))
        .cornerRadius(10)
        .padding(.top, 60)
    }
}

struct GreetingCard_Previews: PreviewProvider {
    static var previews: some View {
        GreetingCard()
    }
}
