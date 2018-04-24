//
//  WYUserAccount.swift
//  wy
//
//  Created by chu on 03/04/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import Foundation
import YYModel

private let accountFile: NSString = "useraccount.json"
class WYUserAccount: NSObject {
    
    @objc var uid: String?
    
    @objc var name: String?
    
    @objc var loginpw: String?
    
    @objc var avatar: String?
    
    @objc var gender: String?
    
    @objc var mobile: String?

    @objc var college: String?
    
    @objc var major: String?
    
    @objc var level: String?

    override var description: String{
        return yy_modelDescription()
    }
    
    
    func saveAccount(){
        
        let dict = (self.yy_modelToJSONObject() as? [String:String]) ?? [:]
        print(dict)
        guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []),
            let filePath = accountFile.cz_appendDocumentDir() else{
                return
        }
        
        (data as NSData).write(toFile: filePath, atomically: true)
        
        print("保存成功\(filePath)")

    }
    
    override init() {
        super.init()
        
        //加载保存文件
        guard let path = accountFile.cz_appendDocumentDir(),
              let data = NSData(contentsOfFile: path),
              let dict = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [String:AnyObject] else{
                return
        }
        
        yy_modelSet(with: dict ?? [:])
        
        print("沙盒")
        
    }
    
    
    
    
}
