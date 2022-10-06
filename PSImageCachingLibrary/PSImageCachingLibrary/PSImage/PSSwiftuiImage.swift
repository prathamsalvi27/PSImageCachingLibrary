//
//  PSSwiftuiImage.swift
//  PSImageCachingLibrary
//
//  Created by Prathamesh Salvi on 01/10/22.
//

import Foundation
import SwiftUI
enum PSPlaceHolderImageType {
    // Plain Image with random pastel colors
    case imageWithPastelColor
    // Any Custom PlaceHolder image which user can pass
    case customPlaceHolder(UIImage)
    // Fixed Placeholder Image defined by app. Developer needs to define it other wise it will return image with pastel color
    case appsDefaultPlaceHolderImage
}
struct PFSwiftUIImageView: View {
    private enum ImageViewState {
        case loading, success(UIImage), failure
    }
    @State private var viewState: ImageViewState
    var imageUrl: String?
    var placeHolderType: PSPlaceHolderImageType
    var toSaveImage: Bool
    /* Activity(ProgressView) Indicator is available in Swiftui from ios 14, Although we can use UIViewRepresentable. But for now I have excluded the feature of Loader on ImageView in Swiftui
     */
//    var showLoader: Bool
    
    init(url: String?, placeHolder: PSPlaceHolderImageType = .imageWithPastelColor, toSave: Bool = true) {
        self.imageUrl = url
        self.placeHolderType = placeHolder
        self.toSaveImage = toSave
        viewState = .loading
    }
    
    var body: some View {
        self.contentView
    }
    
    private var contentView: AnyView {
        switch self.viewState {
        case .loading:
            return AnyView(loadingView)
        case .failure:
            return AnyView(failureView)
        case .success(let image):
            return AnyView(Image(uiImage: image).resizable())
        }
    }

    func setImage(imageStr: String?, toSave: Bool) {
        guard let imageURL = imageStr, !imageURL.isEmpty else {
            self.viewState = .failure
            return
        }
        
        if PSCachedImageManager.sharedManager.cachedImage(imageURL) == nil {
            PSCachedImageManager.sharedManager.loadImage(imageURL, toSave: toSave) { image in
                switch image {
                case .image(let uiImage):
                    self.viewState = .success(uiImage)
                case .empty:
                    self.viewState = .failure
                }
            }
        } else {
            if let image = PSCachedImageManager.sharedManager.cachedImage(imageURL) {
                self.viewState = .success(image)
            } else {
                self.viewState = .failure
            }
        }
    }
}

extension PFSwiftUIImageView {
    var loadingView: some View {
        PFPlaceHolderImage(type: self.placeHolderType).onAppear {
            self.setImage(imageStr: self.imageUrl, toSave: self.toSaveImage)
        }
    }
    
    var failureView: some View {
        PFPlaceHolderImage(type: self.placeHolderType)
    }
}

struct PFPlaceHolderImage: View {
    var placeholderImage: Image
    var appDefaultPlaceHolderImage: UIImage = UIImage(named: "placeholder") ?? UIImage()
    init(type: PSPlaceHolderImageType) {
        switch type {
        case .imageWithPastelColor:
            if let index = PSColorConstant.pastelColorArray.indices.randomElement(), let randomColorImage = UIImage(color: PSColorConstant.pastelColorArray[index]) {
                placeholderImage = Image(uiImage: randomColorImage).resizable()
            } else if let randomColorImage = UIImage(color: PSColorConstant.pastelColorArray[0]) {
                placeholderImage = Image(uiImage: randomColorImage).resizable()
            } else {
                placeholderImage = Image(uiImage: UIImage()).resizable()
            }
        case .customPlaceHolder(let image):
            placeholderImage = Image(uiImage: image).resizable()
        case .appsDefaultPlaceHolderImage:
            placeholderImage = Image(uiImage: self.appDefaultPlaceHolderImage).resizable()
        }
        
    }
    var body: some View {
        placeholderImage
    }
}
