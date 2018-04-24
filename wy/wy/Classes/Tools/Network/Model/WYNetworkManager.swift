//
//  WBNetworkManager.swift
//  wy
//
//  Created by chu on 22/02/2018.
//  Copyright © 2018 chu. All rights reserved.
//2.00BvvVDGNmwfQC8977bd9962SAfhKD

import UIKit
import AFNetworking


//支持任意类型
enum WYHTTPMethod {
    case GET
    case POST
}

class WYNetworkManager: AFHTTPSessionManager {
    var result = [[String: String]]()
    var temp = [String: String]()
    
    static let shared : WYNetworkManager = {
        
        let instance = WYNetworkManager()
        
        instance.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
        return instance
    }()
    
    
    
    lazy var userAccount = WYUserAccount()
    
    var userLogon: Bool{
        return userAccount.uid != nil
    }
    
    
    
    
    func request(method: WYHTTPMethod = .GET, URLString: String, parameters: [String:String]?, completion: @escaping (AnyObject?, Bool)->()){
        
        let success = {(task:URLSessionDataTask,json:Any) ->() in
            completion(json as AnyObject?,true)
        }
        
        let failure = {(task:URLSessionDataTask?,error:Error) ->() in
            print("bad network")
            if (task?.response as? HTTPURLResponse)?.statusCode == 403{
                print("Token 错误")
            }
            
            
            completion(nil, false)
        }
        
        
        if method == .GET {
            get(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
        else{
            post(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
    }
}
