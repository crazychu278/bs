//
//  WYStatusListViewModel.swift
//  wy
//
//  Created by chu on 14/03/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import Foundation
//列表数据模型
// kvc 字典转模型 NS Object

private let maxPullupErrorTimes = 3;

class WYStatusListViewModel {
    
    private var pullupErrorTimes = 0;
    lazy var statusList = [WYStatus]()
    lazy var shopStatusList = [WYShop]()
    
    private var printerSid = 0
    
//    func loadShopStatus(completion:@escaping (Bool,Bool)->())  {
//
//        var urlString = "http://www.yunprint.com/api/cse49910p/getservices/sid"
//        request(URLString: urlString, parameters: nil){ (json, isSuccess) in
//            let result = json as? [[String: String]]
//            completion(result,isSuccess)
//        }
    
    
    func loadStatus(pullup: Bool, completion:@escaping (Bool,Bool)->())  {
        
        if pullup && pullupErrorTimes>maxPullupErrorTimes{
            completion(true,false)
            return
        }

        WYNetworkManager.shared.statusList{ (list,isSuccess) in
            //字典转模型

            guard let array = NSArray.yy_modelArray(with: WYStatus.self,  json: list ?? []) as? [WYStatus] else{
                completion(isSuccess,false)
                return
            }
            if pullup {
                self.statusList = array
            }else{
                self.statusList = array
            }
            
            
            completion(isSuccess,false)
        }
    }
}
