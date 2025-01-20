//
//  FoodScanningPageView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 17/01/25.
//

import SwiftUI
import PhotosUI

struct FoodScanningPageView: View {
    @State private var showAlert = true
    @State private var cameraAccessGranted = false
    @State private var zoomLevel = 1.0
    @State private var selectedImage: UIImage?
    @State private var showGallery = false
    @State private var showNutritionResults = false
    @State private var isInActive = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if cameraAccessGranted {
                    // Camera Scanner Background
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
                    .background {
                            Color.white
                             .blur(radius: 100, opaque: false)
                            }
                    .cornerRadius(10)
                    .padding(.top, 60)

                    Spacer()

                    // Bottom Bar
                    HStack {
                        Button {
                            showGallery = true
                        } label: {
                            Image("Gallery")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        .sheet(isPresented: $showGallery) {
                            GalleryPickerView(selectedImage: $selectedImage, showNutritionResults: $showNutritionResults)
                        }
                        .fullScreenCover(isPresented: $showNutritionResults) {
                            ScanningLoaderView()
                        }

                        Spacer()
                        
                        Button {
                            showNutritionResults = true
                        } label: {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 70, height: 70)
                                .overlay(Image("Camera").foregroundColor(.white))
                        }
                        .fullScreenCover(isPresented: $showNutritionResults) {
                            ScanningLoaderView()
                        }
                        
                        Spacer()

                        Button {
                            zoomLevel = (zoomLevel == 1.0 ? 2.0 : 1.0)
                        } label: {
                            Text("\(Int(zoomLevel))x")
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
            .navigationBarItems(trailing: Button(action: {
                // Flash toggle action
            }) {
                Image("Flash")
                    .foregroundColor(.yellow)
            })
            .navigationBarItems(leading: Button(action: {
                self.isInActive = true
            }) {
                    Image("keyboard_arrow_left")
            })
            .navigate(to: ContentView(), when: $isInActive)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Allow \"Nutrition Scanning\" to use your camera?")
                        .font(.headline),
                    message: Text("You can change this setting in the App section of your device Settings."),
                    primaryButton: .default(Text("Allow Access"), action: {
                        cameraAccessGranted = true
                    }),
                    secondaryButton: .destructive(Text("Don't Allow"), action: {
                        cameraAccessGranted = false
                        self.isInActive = true
                    })
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
