//
//  WYShoppingCartCell.swift
//  wy
//
//  Created by chu on 06/04/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYShoppingCartCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var numbers: UILabel!
    
    @IBOutlet weak var tyoes: UILabel!
    
    @IBOutlet weak var payMoney: UILabel!
    
    
    @IBOutlet weak var pay: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
