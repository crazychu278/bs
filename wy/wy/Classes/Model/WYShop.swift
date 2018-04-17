//
//  File.swift
//  wy
//
//  Created by chu on 04/04/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import Foundation
import YYModel

class WYShop: NSObject {
    
    @objc var shopname: String?
    @objc var descrip: String?
    @objc var blindprice: String?
    @objc var name: String?
    @objc var face: String?
    
    override var description: String{
        return yy_modelDescription()
    }
}
