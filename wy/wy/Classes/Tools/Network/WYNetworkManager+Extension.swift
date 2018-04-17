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
        
            request(URLString: "http://www.yunprint.com/api/cse49910p/getservices/sid/huacai", parameters: nil){ (json, isSuccess) in
              
            }
            completion([[:]],true)
    }
    
    
    func getArray() {
        self.result = []

        let allSid = [["sid": "kjldong","name": "科技楼东复印店"],
                      //["sid": "henyou","name": "恒优速达复印"],
            //["sid": "bhtsg","name": "图书馆文印室"],
            ["sid": "wenyin","name": "文印服务部"],
            //["sid": "haohaolai","name": "好好来复印打印"],
            //["sid": "dafuyin","name": "胜古网吧打印复印"],
            ["sid": "huacai","name": "华彩快印店"],
            ["sid": "xinguang","name": "新光数码快印"]]



        for item in allSid {
            let URLString = "http://www.yunprint.com/api/cse49910p/getservices/sid/"+item["sid"]!
            request(URLString: URLString, parameters: nil){ (json, isSuccess) in
                guard let dicArray = json as? [[String:AnyObject]] else {
                    return
                }
                for dic in dicArray {
                    guard let name = dic["name"] as? String else {
                        continue
                    }
                    guard let descrip = dic["descrip"] as? String else {
                        continue
                    }
                    guard let face = dic["face"] as? String else {
                        continue
                    }
                    self.temp["face"] = face
                    self.temp["shopname"] = item["name"]
                    self.temp["descrip"] = descrip
                    self.temp["name"] = name
                    self.temp["blindprice"] = "0.1"
                }
                self.result.append(self.temp)
            }
        }
    }
    
    func setUserAccount(URLString: String,completion: @escaping ([String: AnyObject]?,Bool)->()){
        request(URLString: URLString, parameters: nil){ (json, isSuccess) in
            let result = json as? [String: AnyObject]
            self.userAccount.yy_modelSet(with: (json as? [String: AnyObject]) ?? [:])
            self.userAccount.saveAccount()
            completion(result,isSuccess)
        }
    }

}
