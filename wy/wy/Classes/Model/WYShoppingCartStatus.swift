//
//  WYWYstatus.swift
//  wy
//
//  Created by chu on 13/03/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit
import YYModel

class WYShoppingCartStatus: NSObject {

    @objc var shopname: String?
    
    @objc var name: String?
    
    @objc var blindprice: String?
    
    @objc var number: String?
    
    @objc var face: String?

    override var description: String{
        return yy_modelDescription()
    }
}
