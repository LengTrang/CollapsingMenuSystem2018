//
//  SwiftTableView.swift
//  CollapsingMenu2018
//
//  Created by Leng Trang on 12/8/18.
//  Copyright © 2018 amo. All rights reserved.
//

import UIKit

class SwiftTableView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
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

extension SwiftTableView: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.headerCategories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.headerCountTemp[section] as Int
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SwiftTableViewCell
        cell.titleLbl.text = "\(headerCategories[indexPath.section].subject[indexPath.row].name)"
        cell.imageViewCell.image = UIImage(named: "\(headerCategories[indexPath.section].subject[indexPath.row].imageName)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
        button.setTitle("\(headerCategories[section].name)", for: UIControl.State())
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.addTarget(self, action: #selector(SwiftTableView.headerEvent(_:)), for: UIControl.Event.touchUpInside)
        button.backgroundColor = UIColor.blue
        button.tag = section
        return button
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    @IBAction func headerEvent(_ button: UIButton){
        self.headerCountTemp[button.tag] = self.headerCountTemp[button.tag] == 0 ? headerCategories[button.tag].subject.count : 0
        UIView.animate(withDuration: 0.8, animations: {
            self.tableView.reloadSections(IndexSet(integer: button.tag), with: .none)
        })
    }
}
