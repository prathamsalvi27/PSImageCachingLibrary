//
//  ExtensionsHelper.swift
//  PSImageCachingLibrary
//
//  Created by Prathamesh Salvi on 01/10/22.
//

import Foundation
import UIKit
let kEmptyStr = ""
public extension UIImage {
  convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
    let rect = CGRect(origin: .zero, size: size)
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
    color.setFill()
    UIRectFill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    guard let cgImage = image?.cgImage else { return nil }
    self.init(cgImage: cgImage)
  }
}

public extension UIColor {
    /// Initializes with a hex color value string.
    /// If the conversion fails, the initialized object will have white color value.
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        
        var hexStr = kEmptyStr
        
        if hexString.hasPrefix("#") {
            let nsHex = hexString as NSString
            hexStr = nsHex.substring(from: 1)
        } else {
            hexStr = hexString
        }
        
        let scanner = Scanner(string: hexStr)
        var hexValue: CUnsignedLongLong = 0
        if scanner.scanHexInt64(&hexValue) {
            switch hexStr.count {
            case 3:
                red = CGFloat((hexValue & 0xF00) >> 8) / 15.0
                green = CGFloat((hexValue & 0x0F0) >> 4) / 15.0
                blue = CGFloat(hexValue & 0x00F) / 15.0
                
            case 6:
                red = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8) / 255.0
                blue = CGFloat(hexValue & 0x0000FF) / 255.0
                
            default:
                debugPrint("Invalid HEX string, number of characters after '#' should be either 3, 6", terminator: "")
            }
        } else {
            debugPrint("Scan hex error")
        }
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// Converts UIColor to hex color value string.
    var hexString: String? {
        guard let colorModel = cgColor.colorSpace?.model, let components = cgColor.components else {
            return nil
        }
        
        var red = 0
        var green = 0
        var blue = 0
        var alpha = 0
        
        if colorModel.rawValue == CGColorSpaceModel.monochrome.rawValue {
            red = lroundf(Float(components[0]) * 255)
            green = lroundf(Float(components[0]) * 255)
            blue = lroundf(Float(components[0]) * 255)
            alpha = lroundf(Float(components[1]) * 255)
        } else if colorModel.rawValue == CGColorSpaceModel.rgb.rawValue {
            red = lroundf(Float(components[0]) * 255)
            green = lroundf(Float(components[1]) * 255)
            blue = lroundf(Float(components[2]) * 255)
            alpha = lroundf(Float(components[3]) * 255)
        }
        
        if alpha == 255 {
            return String(format: "#%02lX%02lX%02lX", red, green, blue)
        } else if alpha < 255 {
            return String(format: "#%02lX%02lX%02lX%02lX", alpha, red, green, blue)
        } else {
            return nil
        }
    }
}
