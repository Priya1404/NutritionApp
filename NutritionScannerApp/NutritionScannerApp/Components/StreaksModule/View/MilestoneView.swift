//
//  MilestoneView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 20/01/25.
//

import SwiftUI

struct MilestoneView: View {
    @StateObject private var viewModel = MilestoneViewModel()

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
                ForEach(0..<viewModel.streakMilestones.count, id: \.self) { index in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(hex: viewModel.milestoneColors[index]))
                            .frame(height: 60)

                        HStack {
                            Image(viewModel.milestoneIcons[index])
                                .resizable()
                                .frame(width: 15, height: 15)
                                .padding()

                            Text("\(viewModel.streakMilestones[index])-day streak achiever")
                                .font(.caption)
                                .multilineTextAlignment(.center)

                            Spacer()

                            if viewModel.isMilestoneAchieved[index] {
                                Image("check_circle")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .padding()
                            }
                        }
                        .padding(.horizontal)
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
