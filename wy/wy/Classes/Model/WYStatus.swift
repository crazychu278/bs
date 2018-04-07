//
//  WYWYstatus.swift
//  wy
//
//  Created by chu on 13/03/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit
import YYModel

class WYStatus: NSObject {

    @objc var sid: String?
    
    @objc var name: String?
    
    var user: WYShop?

    override var description: String{
        return yy_modelDescription()
    }
}
