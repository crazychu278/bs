//
//  Bundle+Extensions.swift
//  wy
//
//  Created by chu on 06/02/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import Foundation
extension Bundle{
    var namespace:String{
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
