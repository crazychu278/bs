//
//  WYOrderDetailCell.swift
//  wy
//
//  Created by chu on 21/04/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYOrderDetailCell: UITableViewCell {


    @IBOutlet weak var oid: UILabel!
    
    @IBOutlet weak var state: UILabel!
    

    @IBOutlet weak var filenum: UILabel!
    
    @IBOutlet weak var takepw: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
