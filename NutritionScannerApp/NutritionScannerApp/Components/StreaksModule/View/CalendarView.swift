//
//  CalendarView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 20/01/25.
//

import SwiftUI

struct CalendarView: View {
    let days = ["M", "T", "W", "T", "F", "S", "S"]

    var body: some View {
        VStack(spacing: 10) {
            // Days Header
            HStack(spacing: 10) {
                ForEach(days.indices, id: \.self) { index in
                    Text(days[index])
                        .font(.caption)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(index >= 2 ? .green : .primary)
                }
            }

            // Date Rows
            ForEach(1...2, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(1...7, id: \.self) { col in
                        if row == 1 && col < 3 {
                            Text("\(col)")
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity)
                        } else if row == 1 && (col >= 3 && col <= 7) {
                            Image("calendarFire")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .frame(maxWidth: .infinity)
                        } else {
                            Text("\(col + 5)")
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray, lineWidth: 1)
        )
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
