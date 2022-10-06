//
//  SwiftUIImageCardView.swift
//  PSImageCachingLibrary
//
//  Created by Prathamesh Salvi on 04/10/22.
//

import SwiftUI

struct SwiftUIImageCardView: View {
    var urlStr: String
    var body: some View {
        PFSwiftUIImageView(url: urlStr, placeHolder: .imageWithPastelColor).frame(width: ImageSize().width, height: ImageSize().height)
    }
}

struct ImageSize {
    let width: CGFloat
    let height: CGFloat
    init() {
        let extraWidth = (UIScreen.main.bounds.width / 2) + 4
        self.height = PSViewUtility.getCalculatedHeightForImage(width: 200, height: 220, extraWidth: extraWidth) + 4
        self.width =  (UIScreen.main.bounds.width / 2) - 4
    }
}

struct SwiftUIImageCardView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIImageCardView(urlStr: "https://picsum.photos/id/237/200/220")
    }
}
