//
//  CoreImageVC.swift
//  Instafilter
//
//  Created by Ваня Науменко on 3.04.24.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct CoreImageVC: View {
    @State private var image: Image?
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }

    func loadImage() {
        let inputImage = UIImage(resource: .chopper)
        let beginImage = CIImage(image: inputImage)
        let context = CIContext()
        let currentFilter = CIFilter.twirlDistortion()
        currentFilter.inputImage = beginImage

        let amount = 1.0
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)}
        if inputKeys.contains(kCIInputScaleKey) {currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)}

//        currentFilter.radius = 200
//        currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)

        // получите CIImage из нашего фильтра или выйдите, если это не удастся
        guard let outputImage = currentFilter.outputImage else { return }
        // попытайтесь получить CGImage из нашего CIImage
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        // преобразовать это в UIImage
        let uiImage = UIImage(cgImage: cgImage)
        // и преобразовать это в изображение SwiftUI
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    CoreImageVC()
}
