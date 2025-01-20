//
//  StreaksPageView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 17/01/25.
//

import SwiftUI

import SwiftUI

struct StreaksPageView: View {
    @State private var showShareSheet = false
    let streakNumber = 5 // Mock data for streak count
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Top Image with Streak Number
                    ZStack {
                        Image("fire")
                            .resizable()
                            .frame(width: 120, height: 140)
                        Text("\(streakNumber)")
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
                        Text("\(streakNumber) Days Streak")
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
                showShareSheet.toggle()
            }) {
                Image("Share")
            })
        }
        .sheet(isPresented: $showShareSheet) {
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
