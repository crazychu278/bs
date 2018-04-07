//
//  WYUserAccount.swift
//  wy
//
//  Created by chu on 03/04/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import Foundation

class WYUserAccount: NSObject {
    
    @objc var uid: String?
    @objc var name: String?
    @objc var avatar: String?
    
    @objc var gender: String?
    
    @objc var mobile: String?

    @objc var college: String?
    @objc var major: String?
    
    @objc var level: String?
    
    @objc var balance: String?
    
    
    override var description: String{
        return yy_modelDescription()
    }
    
    
    func saveAccount(){
        let dict = self.yy_modelToJSONObject() as? [String:String]
        
        guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []),
            let filePath = ("useraccount.json" as NSString).cz_appendTempDir() else{
                return
        }
        
        (data as NSData).write(toFile: filePath, atomically: true)
        
        print("保存成功")
        
        
        
        
    }
    
    
    
    
}
