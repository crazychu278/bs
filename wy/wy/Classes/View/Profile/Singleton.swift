//
//  Singleton.swift
//  wy
//
//  Created by chu on 21/04/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import Foundation

class Singleton {
    
    // 单例属性，用于传值；
    var text: String!
    
    private static let _singleton = Singleton()
    
    // 获取单例实例方法
    class func sharedInstance() ->Singleton {
        return _singleton
    }
    
    // 私有化init初始化方法，防止通过此方法创建对象
    private init() {
    }
}
