//
//  BottomBarView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 21/01/25.
//

import SwiftUI

struct BottomBarView: View {
    @ObservedObject var viewModel: FoodScanningViewModel

    var body: some View {
        HStack {
            Button {
                viewModel.state.showGallery = true
            } label: {
                Image("Gallery")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .sheet(isPresented: $viewModel.state.showGallery) {
                GalleryPickerView(
                    selectedImage: $viewModel.state.selectedImage,
                    showNutritionResults: $viewModel.state.showNutritionResults
                )
            }

            Spacer()

            Button {
                viewModel.state.showNutritionResults = true
            } label: {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 70, height: 70)
                    .overlay(Image("Camera").foregroundColor(.white))
            }
            .fullScreenCover(isPresented: $viewModel.state.showNutritionResults) {
                ScanningLoaderView()
            }

            Spacer()

            Button {
                viewModel.toggleZoomLevel()
            } label: {
                Text("\(Int(viewModel.state.zoomLevel))x")
                    .font(.headline)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(Color.black.opacity(0.7))
    }
}

