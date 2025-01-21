//
//  FoodScanningPageView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 17/01/25.
//

import SwiftUI
import PhotosUI

struct FoodScanningPageView: View {
    @StateObject private var viewModel = FoodScanningViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                // Camera Scanner Background
                if viewModel.state.isCameraAccessGranted {
                    Color.black
                        .ignoresSafeArea()
                        .overlay(
                            VStack {
                                Spacer()
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 2)
                                    .frame(width: 300, height: 300)
                                Spacer()
                            }
                        )
                } else {
                    Image("pizzaBackground")
                        .resizable()
                        .ignoresSafeArea()
                }

                // Scanner Card
                VStack {
                    GreetingCard()

                    Spacer()

                    // Bottom Bar
                    BottomBarView(viewModel: viewModel)
                }
            }
            .navigationBarItems(
                leading: BackButton(isInactive: $viewModel.isInactive),
                trailing: FlashButton()
            )
            .navigate(to: ContentView(), when: $viewModel.isInactive)
            .alert(isPresented: $viewModel.state.showAlert) {
                Alert(
                    title: Text("Allow \"Nutrition Scanning\" to use your camera?"),
                    message: Text("You can change this setting in the App section of your device Settings."),
                    primaryButton: .default(Text("Allow Access")) {
                        viewModel.handleCameraPermission(granted: true)
                    },
                    secondaryButton: .destructive(Text("Don't Allow")) {
                        viewModel.handleCameraPermission(granted: false)
                    }
                )
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FoodScanningPageView_Previews: PreviewProvider {
    static var previews: some View {
        FoodScanningPageView()
    }
}
