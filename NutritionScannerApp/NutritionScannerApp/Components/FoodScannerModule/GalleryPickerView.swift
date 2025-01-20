//
//  GalleryPickerView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 20/01/25.
//

import SwiftUI
import PhotosUI

struct GalleryPickerView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Binding var showNutritionResults: Bool

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images // Only allow image selection
        config.selectionLimit = 1

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: GalleryPickerView

        init(_ parent: GalleryPickerView) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            if let result = results.first, result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                result.itemProvider.loadObject(ofClass: UIImage.self) { image, _ in
                    DispatchQueue.main.async {
                        self.parent.selectedImage = image as? UIImage
                        self.parent.showNutritionResults = true
                    }
                }
            }
        }
    }
}
