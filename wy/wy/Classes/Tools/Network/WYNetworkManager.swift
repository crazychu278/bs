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
    static let shared = WYNetworkManager()
    
    func request(method: WYHTTPMethod = .GET, URLString: String, parameters: [String:AnyObject], completion: @escaping (_ json:Any?,  _ isSuccess:Bool)->()){
        
        let success = {(task:URLSessionDataTask,json:Any?) ->() in
            completion(json,true)
        }
        
        let failure = {(task:URLSessionDataTask?,error:Error) ->() in
            print("bad network")
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
