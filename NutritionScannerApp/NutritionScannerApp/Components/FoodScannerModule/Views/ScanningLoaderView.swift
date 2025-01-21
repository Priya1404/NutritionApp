//
//  ScanningLoaderView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 20/01/25.
//

import SwiftUI

struct ScanningLoaderView: View {
    @State private var progress: CGFloat = 0.0
    @State private var isScanningComplete = false

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()

            VStack {

                Image("nutrak_logo")
                    .resizable()
                    .frame(width: 90, height: 70)
                
                Spacer()
                
                Image ("loader")
                    .resizable()
                    .frame(width: 144, height: 144)

                Text("Scanning in progress...")
                    .font(.headline)
                    .padding(.top, 20)

                // Progress Bar
                ProgressView(value: progress, total: 100)
                    .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                    .frame(width: 200)
                    .padding(.top, 20)

                Text("\(Int(progress))%")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 10)

                Spacer()
            }
        }
        .onAppear {
            startScanning()
        }
        .navigationBarHidden(true)
        .navigate(to: NutritionResultsPageView(), when: $isScanningComplete)
    }

    private func startScanning() {
        Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
            if progress < 100 {
                progress += 1
            } else {
                timer.invalidate()
                isScanningComplete = true
            }
        }
    }
}

struct ScanningLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        ScanningLoaderView()
    }
}
