//
//  WYOrderState.swift
//  wy
//
//  Created by chu on 17/04/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit
import YYModel

class WYOrderState: NSObject {
    @objc var status: String?
    
    override var description: String{
        return yy_modelDescription()
    }
}
