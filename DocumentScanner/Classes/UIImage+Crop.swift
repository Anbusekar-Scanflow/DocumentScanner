//
//  UIImage+Crop.swift
//  DocumentScanner
//
//  Created by Stanislav Dimitrov on 21.11.17.
//

import UIKit
import AVFoundation

extension UIImage {

    func crop(toPreviewLayer layer: AVCaptureVideoPreviewLayer, withRect rect: CGRect) -> UIImage {
        let outputRect = layer.metadataOutputRectConverted(fromLayerRect: rect)
        var cgImage = self.cgImage!
        let width = CGFloat(cgImage.width)
        let height = CGFloat(cgImage.height)
        let cropRect = CGRect(
            x: outputRect.origin.x * width,
            y: outputRect.origin.y * height,
            width: outputRect.size.width * width,
            height: outputRect.size.height * height)

        cgImage = cgImage.cropping(to: cropRect)!
        let croppedUIImage = UIImage(cgImage: cgImage, scale: self.scale, orientation: self.imageOrientation)

        return croppedUIImage
    }
}