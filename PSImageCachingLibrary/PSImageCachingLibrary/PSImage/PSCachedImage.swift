//
//  PSCachedImage.swift
//  PSImageCachingLibrary
//
//  Created by Prathamesh Salvi on 01/10/22.
//

import Foundation
import UIKit

class PFCachedImage {
    let image: UIImage
    let identifier: String
    let totalBytes: UInt64
    var lastAccessDate: Date
    
    init(_ image: UIImage, identifier: String) {
        self.image = image
        self.identifier = identifier
        self.lastAccessDate = Date()
        totalBytes = {
            let size = CGSize(width: image.size.width * image.scale, height: image.size.height * image.scale)
            let bytesPerPixel: CGFloat = 4.0
            let bytesPerRow = size.width * bytesPerPixel
            let totalBytes = UInt64(bytesPerRow) * UInt64(size.height)
            return totalBytes
        }()
    }
    
    func accessImage() -> UIImage {
        lastAccessDate = Date()
        return image
    }
}
