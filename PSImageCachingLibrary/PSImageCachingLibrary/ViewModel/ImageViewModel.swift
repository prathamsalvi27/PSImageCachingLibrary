//
//  ImageViewModel.swift
//  PSImageCachingLibrary
//
//  Created by Prathamesh Salvi on 01/10/22.
//

import Foundation
import UIKit
struct ImageVM {
    let url: String
    var height: CGFloat
    var width: CGFloat
    
    init(url: String, rawHeight: CGFloat, rawWidth: CGFloat) {
        self.url = url
        let extraWidth = (UIScreen.main.bounds.width / 2) + 4
        self.height = PSViewUtility.getCalculatedHeightForImage(width: rawWidth, height: rawHeight, extraWidth: extraWidth) + 4
        self.width =  (UIScreen.main.bounds.width / 2) - 4
    }
    
}
