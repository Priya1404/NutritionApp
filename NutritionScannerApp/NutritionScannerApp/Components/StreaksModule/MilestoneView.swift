//
//  MilestoneView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 20/01/25.
//

import SwiftUI

struct MilestoneView: View {
    let milestoneColors = ["#EBEDF0", "#FFF8F0", "#E6F3FA", "#EDE6FA"]

    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text("Milestones")
                    .font(.headline)
                Spacer()
                Button("View All >") {
                    print("View All tapped")
                }
                .font(.subheadline)
                .foregroundColor(.gray)
            }

            VStack(spacing: 15) {
                ForEach(0..<4) { index in
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(hex: milestoneColors[index]))
                                .frame(width: .infinity, height: 60)
                            HStack{
                                Image(["Silver", "Bronze", "Gold", "Platinum"][index])
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .padding()
                                
                                Text("\(["7", "10", "20", "30"][index])-day streak achiever")
                                    .font(.caption)
                                    .multilineTextAlignment(.center)
                                
                                Spacer()
                                
                                if index == 0 { //assumption of completion
                                    Image("check_circle")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .padding()
                                }
                            }
                        }
                    }
                }
            }
        }
    .padding()
    }
}

struct MilestoneView_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneView()
    }
}
