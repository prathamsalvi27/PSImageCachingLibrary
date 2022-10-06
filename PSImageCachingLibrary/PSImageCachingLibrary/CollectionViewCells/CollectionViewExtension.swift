//
//  CollectionViewExtension.swift
//  PSImageCachingLibrary
//
//  Created by Prathamesh Salvi on 01/10/22.
//

import Foundation
import UIKit
extension UICollectionView {
    // Identifier & Nib name should be same for this method
    func registerCellWithIdentifier(_ identifier: String) {
        register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }

    // Identifier & Nib name should be same for this method
    func registerHeaderWithIdentifier(_ identifier: String) {
        register(UINib(nibName: identifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifier)
    }
}

extension UICollectionViewCell {
    class var identifier: String {
        return String(describing: self)
    }
}
