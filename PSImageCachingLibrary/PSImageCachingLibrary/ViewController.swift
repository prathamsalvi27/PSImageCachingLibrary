//
//  ViewController.swift
//  PSImageCachingLibrary
//
//  Created by Prathamesh Salvi on 01/10/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageArray: [ImageVM] = [
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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpNavBarRightButton()
        setUpCollectionView()
    }
    
    private func setUpCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.registerCellWithIdentifier(CollectionViewCell.identifier)
    }
    
    private func setUpNavBarRightButton() {
        let btn = UIButton()
        btn.setTitleColor(.blue, for: .normal)
        btn.setTitle("OpenSwiftUIPage", for: .normal)
        btn.addTarget(self, action: #selector(openSwiftUIPage), for: .touchUpInside)
        let barBtnItem = UIBarButtonItem(customView: btn)
        self.navigationItem.rightBarButtonItem = barBtnItem
    }
    
    @objc func openSwiftUIPage() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SwiftUIVc") as! SwiftUIImagesViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    //MARK: - Collection View Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.imageView.setImageWithUrl(imageArray[indexPath.item].url, placeHolderType: .appsDefaultPlaceHolderImage)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let vm = self.imageArray[indexPath.item]
        return CGSize(width: vm.width, height: vm.height)
    }

}

