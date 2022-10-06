//
//  SwiftUIImageListView.swift
//  PSImageCachingLibrary
//
//  Created by Prathamesh Salvi on 04/10/22.
//

import SwiftUI

struct SwiftUIImageListView: View {
    @State var imageArray: [ImageVM] = [
        ImageVM(url: "https://picsum.photos/id/237/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/238/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/241/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/242/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/243/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/244/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/230/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/246/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/247/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/248/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/249/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/250/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/251/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/252/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/253/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/254/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/255/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/256/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/257/200/220", rawHeight: 220, rawWidth: 200),
        ImageVM(url: "https://picsum.photos/id/258/200/220", rawHeight: 220, rawWidth: 200),
    ]
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout) {
                ForEach((0..<imageArray.count), id: \.self) { i in
                    let vm = imageArray[i]
                    PFSwiftUIImageView(url: vm.url, placeHolder: .imageWithPastelColor).frame(width: ImageSize().width, height: ImageSize().height)
                }
            }
        }
    }
}

struct SwiftUIImageListView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIImageListView()
    }
}
