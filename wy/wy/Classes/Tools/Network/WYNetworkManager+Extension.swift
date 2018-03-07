//
//  File.swift
//  wy
//
//  Created by chu on 07/03/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import Foundation

extension WYNetworkManager{
    
    
    
    func statusList(completion:@escaping (_ list:[[String: AnyObject]]?,_ isSuccess:Bool)->()) -> () {
        let URLString = "https://api.weibo.com/2/statuses/public_timeline.json"

        tokenRequest(URLString: URLString, parameters: nil) { (json, isSuccess) in
            let result = (json as AnyObject) ["statuses"] as? [[String:AnyObject]]
            completion(result,isSuccess)
        }
    }
}
