//
//  PSViewUtility.swift
//  PSImageCachingLibrary
//
//  Created by Prathamesh Salvi on 01/10/22.
//

import Foundation
import UIKit
class PSViewUtility {
    static func getCalculatedHeightForImage(width: CGFloat, height: CGFloat, extraWidth: CGFloat = 0) -> CGFloat {
        let widthOffset = width - (UIScreen.main.bounds.width - extraWidth)
        let widthOffsetPercentage = (widthOffset*100)/width
        let heightOffset = (widthOffsetPercentage * height)/100
        let effectiveHeight = height - heightOffset
        return effectiveHeight
    }
}
