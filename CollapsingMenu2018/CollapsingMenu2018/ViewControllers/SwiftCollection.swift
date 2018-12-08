//
//  SwiftCollectionViewController.swift
//  CollapsingMenu2018
//
//  Created by Leng Trang on 12/7/18.
//  Copyright © 2018 amo. All rights reserved.
//

import UIKit

class SwiftCollection: UIViewController {
    @IBOutlet weak var swiftCollectionView: UICollectionView!
    
    var headerCountTemp: [Int] = []
    var headerCategories: [Categories] = [Categories(name: "Categories 1", subject: [Subject(name: "Topic 1", imageName: "Money"), Subject(name: "Topic 2", imageName: "Links"), Subject(name: "Topic 3", imageName: "Connected"), Subject(name: "Topic 4", imageName: "Dots"), Subject(name: "Topic 5", imageName: "Hex"), Subject(name: "Topic 6", imageName: "Payments"), Subject(name: "Topic 6", imageName: "Payments"), Subject(name: "Topic 7", imageName: "Ring")]) , Categories(name: "Categories 2", subject: [Subject(name: "Hobby", imageName: "Player")]) , Categories(name: "Categories 3", subject: [Subject(name: "Day 1", imageName: "Flower"), Subject(name: "Day 2", imageName: "Disc")])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildTempCategoryList()
    }
    func buildTempCategoryList(){
        for i in 0...headerCategories.count - 1 { self.headerCountTemp.append(headerCategories[i].subject.count) }
    }
}

extension SwiftCollection: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.headerCountTemp[section] as Int
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.headerCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SwiftCollectionCell
        cell.nameLbl.text = "\(headerCategories[indexPath.section].subject[indexPath.row].name)"
        cell.imageView.image = UIImage(named: "\(headerCategories[indexPath.section].subject[indexPath.row].imageName)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "section", for: indexPath) as! SwiftCollectionReusableView
        headerCell.sectionBtn.setTitle("\(headerCategories[indexPath.section].name)", for: UIControl.State())
        headerCell.sectionBtn.addTarget(self, action: #selector(SwiftCollection.headerEvent(_:)), for: UIControl.Event.touchUpInside)
        headerCell.sectionBtn.tag = indexPath.section
        return headerCell
    }
    
    @IBAction func headerEvent(_ button: UIButton){
        self.headerCountTemp[button.tag] = self.headerCountTemp[button.tag] == 0 ? headerCategories[button.tag].subject.count : 0
        UIView.animate(withDuration: 0.8, animations: {
            self.swiftCollectionView.reloadSections(IndexSet(integer: button.tag))
        })
    }
}
