//
//  PSImageViewExtension.swift
//  PSImageCachingLibrary
//
//  Created by Prathamesh Salvi on 01/10/22.
//

import Foundation
import UIKit
extension UIImageView {
    func setImageWithUrl(_ imageStr: String?, placeHolderType: PSPlaceHolderImageType = .imageWithPastelColor, toSave: Bool = true) {
        guard let imageURL = imageStr, !imageURL.isEmpty else {
            self.image = self.getPlaceHolderImage(type: placeHolderType)
            return
        }
        self.image = self.getPlaceHolderImage(type: placeHolderType)
        
        if PSCachedImageManager.sharedManager.cachedImage(imageURL) == nil {
            PSCachedImageManager.sharedManager.loadImage(imageURL, toSave: toSave) { image in
                switch image {
                case .image(let uiImage):
                    self.image = uiImage
                case .empty:
                    self.image = self.getPlaceHolderImage(type: placeHolderType)
                }
            }
        } else {
            if let image = PSCachedImageManager.sharedManager.cachedImage(imageURL) {
                self.image = image
            } else {
                self.image = self.getPlaceHolderImage(type: placeHolderType)
            }
        }
    }
    
    func getPlaceHolderImage(type: PSPlaceHolderImageType) -> UIImage {
        switch type {
        case .imageWithPastelColor:
            if let index = PSColorConstant.pastelColorArray.indices.randomElement(), let randomColorImage = UIImage(color: PSColorConstant.pastelColorArray[index]) {
                return randomColorImage
            } else if let randomColorImage = UIImage(color: PSColorConstant.pastelColorArray[0]) {
                return randomColorImage
            } else {
                return UIImage()
            }
        case .customPlaceHolder(let uIImage):
            return uIImage
        case .appsDefaultPlaceHolderImage:
            return UIImage(named: "placeholder")!
        }
    }
}
