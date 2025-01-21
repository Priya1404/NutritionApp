//
//  StreaksPageView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 17/01/25.
//

import SwiftUI

import SwiftUI

struct StreaksPageView: View {
    @StateObject private var viewModel = StreaksPageViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Top Image with Streak Number
                    ZStack {
                        Image("fire")
                            .resizable()
                            .frame(width: 120, height: 140)
                        Text("\(viewModel.streakNumber)")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.black)
                    }
                    .padding(.top)

                    // Attributed Text
                    VStack(alignment: .center, spacing: 4) {
                        Text("You're on a")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("\(viewModel.streakNumber) Days Streak")
                            .font(.title2)
                            .bold()
                        Text("Keep it Up!")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .multilineTextAlignment(.center)
                    .padding(.bottom)

                    ZStack {
                        // Calendar View
                        CalendarView()
                            .padding()

                        // Bottom Circular Badge
                        BadgeView()
                            .offset(y: 55)
                    }
                    Spacer()

                    // Milestones View
                    MilestoneView()
                }
            }
            .navigationBarTitle("Streaks", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                viewModel.showShareSheet.toggle()
            }) {
                Image("Share")
            })
        }
        .sheet(isPresented: $viewModel.showShareSheet) {
            Text("Share your streak!")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct StreaksPageView_Previews: PreviewProvider {
    static var previews: some View {
        StreaksPageView()
    }
}
