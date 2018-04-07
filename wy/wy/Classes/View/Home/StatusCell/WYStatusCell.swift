//
//  WYStatusCell.swift
//  wy
//
//  Created by chu on 04/04/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYStatusCell: UITableViewCell {

    @IBOutlet weak var face: UIImageView!
    @IBOutlet weak var desprip: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var blindprice: UILabel!
    @IBOutlet weak var shopname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
