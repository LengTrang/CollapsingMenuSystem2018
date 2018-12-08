//
//  MainMenuViewController.swift
//  CollapsingMenu2018
//
//  Created by Leng Trang on 12/7/18.
//  Copyright © 2018 amo. All rights reserved.
//

import UIKit

class MainMenuViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func swiftCollectionView(_ sender: Any) {
        self.performSegue(withIdentifier: "swiftCollection", sender: nil)
    }
    

}
