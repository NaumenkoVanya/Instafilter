//
//  LoadingPhotosUsLib.swift
//  Instafilter
//
//  Created by Ваня Науменко on 4.04.24.
//
import PhotosUI
import SwiftUI

struct LoadingPhotosUsLib: View {
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(0..<selectedImages.count, id: \.self) { i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
                }
            }
            selectedImage?
                .resizable()
                .scaledToFit()
                .padding()
            // загружает все картинти кроме скриншотов
            PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .any(of: [.images, .not(.screenshots)])) {
                Label("Select a picke", systemImage: "photo")
            }
//            ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, subject: Text("Learn Swift here"), message: Text("Check out the 100 Days of SwiftUI!"))
//                .foregroundStyle(.black)
            ShareLink(item: URL(string: "https://www.hackingwithswift.com")!) {
                Label("Spread the word about Swift", systemImage: "swift")
            }
//            PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .images) {
//                Label("Select a picke", systemImage: "photo")
//            }
//            PhotosPicker("Select a picker", selection: $pickerItems,maxSelectionCount: 3, matching: .images)
        }
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()

                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
    }
}

#Preview {
    LoadingPhotosUsLib()
}
