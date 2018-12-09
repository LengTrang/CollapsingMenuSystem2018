//
//  SwiftTableViewCell.swift
//  CollapsingMenu2018
//
//  Created by Leng Trang on 12/8/18.
//  Copyright © 2018 amo. All rights reserved.
//

import UIKit

class SwiftTableViewCell: UITableViewCell {


    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
