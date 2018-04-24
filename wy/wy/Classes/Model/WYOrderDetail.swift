//
//  WYOrderDetail.swift
//  wy
//
//  Created by chu on 19/04/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYOrderDetail: NSObject {

    @objc var oid: String?
    
    //@objc var uid: String?
    
    @objc var state: String?
    
    //@objc var totalamount: String?
    
    @objc var filenum: String?
    
    //@objc var dest: String?
    
    @objc var takepw: String?
    
    override var description: String{
        return yy_modelDescription()
    }
    //http://www.yunprint.com/api/cse49910p/myorders/uid/chengyong
}
