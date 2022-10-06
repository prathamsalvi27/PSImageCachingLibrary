//
//  PSCachedImageManager.swift
//  PSImageCachingLibrary
//
//  Created by Prathamesh Salvi on 01/10/22.
//

import Foundation
import UIKit
enum PFImage {
    case image(UIImage)
    case empty
}
struct PSColorConstant {
    static var pastelColorArray: [UIColor] = [
       UIColor(hexString: "#FFF4E9"),
       UIColor(hexString: "#FEECE9"),
       UIColor(hexString: "#F1F4F5"),
       UIColor(hexString: "#FFEFD5")
    ]
}
final class PSCachedImageManager {
    static let sharedManager = PSCachedImageManager()
    
    private let gifFilePrefix = ".gif"
    
    /**
     Initialization of AutoPurgingImageCache with defined size
     */
    let photoCache = PSAutoPurgingImageCache(memoryCapacity: 50 * 1024 * 1024, preferredMemoryUsageAfterPurge: 30 * 1024 * 1024)
    
    func loadImage(_ urlString: String, toSave: Bool = true, completion: @escaping (PFImage) -> Void) {
        guard let url = URL(string: urlString) else {
            return completion(.empty)
        }
        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, _ in
            var finalImage: UIImage?
            if urlString.hasSuffix(self.gifFilePrefix), let imgData = data, let gif = UIImage.gif(data: imgData) {
                finalImage = gif
                DispatchQueue.main.async {
                    completion(.image(gif))
                }
            } else if let imageData = data, let image = UIImage(data: imageData) {
                finalImage = image
                DispatchQueue.main.async {
                    completion(.image(image))
                }
            } else {
                DispatchQueue.main.async {
                    completion(.empty)
                }
            }
            if toSave, let image = finalImage {
                self.cacheImage(image, urlString: urlString)
            }
        }
        dataTask.resume()
    }
    
    /**
     The function returns cache image from AutoPurgingImageCache
     - Parameters:
     *- urlString: Image URL to server.
     - Returns: Instance of image or nil.
     */
    func cachedImage(_ urlString: String) -> UIImage? {
        return photoCache.image(withIdentifier: urlString)
    }

    /**
     The function cache image to AutoPurgingImageCache
     - Parameters:
     *- image: Instance of UIImage
     *- urlString: Image URL. to server
     - Returns: Void
     */
    private func cacheImage(_ image: UIImage, urlString: String) {
        photoCache.add(image, withIdentifier: urlString)
    }

    func removeCachedImages() {
        photoCache.removeAllImages()
    }
}
