//
//  SwiftUIImagesViewController.swift
//  PSImageCachingLibrary
//
//  Created by Prathamesh Salvi on 01/10/22.
//

import UIKit
import SwiftUI
class SwiftUIImagesViewController: UIViewController {
    var swiftUIHostingVC: UIHostingController<SwiftUIImageListView>!
    var homepageSwiftUIView: SwiftUIImageListView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    private func setUpView() {
        self.homepageSwiftUIView = SwiftUIImageListView()
        self.swiftUIHostingVC = UIHostingController(rootView: homepageSwiftUIView)
        addChild(swiftUIHostingVC)
        self.view.addSubview(swiftUIHostingVC.view)
        setupConstraints()
    }

    private func setupConstraints() {
        swiftUIHostingVC.view.translatesAutoresizingMaskIntoConstraints = false
        swiftUIHostingVC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        swiftUIHostingVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        swiftUIHostingVC.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        swiftUIHostingVC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
