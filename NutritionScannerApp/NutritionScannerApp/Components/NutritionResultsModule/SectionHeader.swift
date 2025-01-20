//
//  SectionHeader.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 20/01/25.
//

import SwiftUI

// Section Header View
struct SectionHeader: View {
    let title: String
    let extraText: String?
    
    init(title: String, extraText: String? = nil) {
        self.title = title
        self.extraText = extraText
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .bold()
            Spacer()
            if let extraText = extraText {
                Text(extraText)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct SectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeader(title: "Nutritional Overview")
    }
}
