//
//  File.swift
//  wy
//
//  Created by chu on 07/03/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import Foundation

extension WYNetworkManager{
    
    
    
//    func statusList(completion:@escaping (_ list:[[String: AnyObject]]?,_ isSuccess:Bool) -> () {
//        let URLString = "http://www.yunprint.com/api/cse49910p/nearshops/uid/chengyong"
//
////        tokenRequest(method : WYHTTPMethod = .GET, URLString: String, parameters: [String:AnyObject]?) { (json, isSuccess) in
////            let result = (json as AnyObject) ["statuses"] as? [[String:AnyObject]]
////            completion(result,isSuccess)
////        }
//
//        request(URLString: URLString, parameters: nil) { (json, isSuccess) in
//            let result = json as? [[String:String]]
//            completion((result as AnyObject, isSuccess)
//        }
//
//    }
    
    func statusList(completion: @escaping ([[String: String]]?,Bool)->()){
        
        let URLString = "http://www.yunprint.com/api/cse49910p/nearshops/uid/chengyong"
        
        request(URLString: URLString, parameters: nil){ (json, isSuccess) in
            let result = json as? [[String: String]]
            completion(result,isSuccess)
        }
    }
    
    
    
    func shopStatusList(completion: @escaping ([[String: String]]?,Bool)->()){
        
        let URLString = "http://www.yunprint.com/api/cse49910p/nearshops/uid/chengyong"
        
        request(URLString: URLString, parameters: nil){ (json, isSuccess) in
            let result = json as? [[String: String]]
            completion(result,isSuccess)
        }
    }
    
//    func getUserData(URLString: String,completion: @escaping ([[String: AnyObject]]?,Bool)->()){
//        
//        request(URLString: URLString, parameters: nil){ (json, isSuccess) in
//            let result = json as? [[String: AnyObject]]
//            print(json!["error"])
//
//            completion(result,isSuccess)
//        }
//    }
    
    
    
}


extension WYNetworkManager{
    
    func loadUserInfo() {
        
        
        
        
        
    }
    
}
