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
    lazy var statusList = [WYShop]()
    lazy var shopStatusList = [WYShoppingCartStatus]()
    lazy var OrderStateList = [WYOrderState]()
    lazy var orderDetail = [WYOrderDetail]()
    private var printerSid = 0
    
    
    var shoppingCartList =
        [["shopname": "文印服务部", "name": "服务彩色黑白文本画册资料打印复印书本装订数码快印彩印", "blindprice": "0.1", "number": "3", "face":"huacaidisplay.jpg"],
        ["shopname": "科技楼东复印店", "name":"服务彩色黑白文本画册资料打印复印书本装订数码快印彩印","blindprice": "0.1","number": "3", "face":"xinguangdisplay.jpg"],
        ["shopname": "新光数码快印", "name": "优质高速黑白彩色打印网上提交随时自提 ", "blindprice": "0.1", "number": "3", "face": "wenyindisplay.jpg"]]
    
    var orderList =
        [
            ["status":"提交状态"],
            ["status":"支付状态"],
            ["status":"收到状态"],
            ["status":"沟通状态"],
            ["status":"接受状态"],
            ["status":"成品状态"],
            ["status":"暂停状态"],
            ["status":"完成状态"],
            ["status":"关闭状态"],
            ["status":"评论状态"],
        ]
    
    
    
    func loadStatus(pullup: Bool, completion:@escaping (Bool,Bool)->())  {
        
        if pullup && pullupErrorTimes>maxPullupErrorTimes{
            completion(true,false)
            return
        }
        
        
        WYNetworkManager.shared.statusList{ (list,isSuccess) in
            //字典转模型
            completion(isSuccess,false)
        }
        
        WYNetworkManager.shared.getArray()
        
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            print(WYNetworkManager.shared.result)
            let array = NSArray.yy_modelArray(with: WYShop.self,  json: WYNetworkManager.shared.result as [[String:AnyObject]]) as! [WYShop]
            if pullup {
                self.statusList = array
            }else{
                self.statusList = array
            }
        }
    }
    
    func loadShoppingCartStatus(pullup: Bool, completion:@escaping (Bool,Bool)->())  {

        WYNetworkManager.shared.statusList{ (list,isSuccess) in
            completion(isSuccess,false)
        }
        
        //字典转模型
        guard let array = NSArray.yy_modelArray(with: WYShoppingCartStatus.self,  json: shoppingCartList as [[String:AnyObject]]) as? [WYShoppingCartStatus] else{
            return
        }
        if pullup {
            self.shopStatusList = array
        }else{
            self.shopStatusList = array
        }
        
    }
    

    
    func loadOrderStatus(pullup: Bool, completion:@escaping (Bool,Bool)->())  {
        
        WYNetworkManager.shared.statusList{ (list,isSuccess) in
            completion(isSuccess,false)
        }
        
        //字典转模型
        guard let array = NSArray.yy_modelArray(with: WYOrderState.self,  json: orderList as [[String:AnyObject]]) as? [WYOrderState] else{
            return
        }
        if pullup {
            self.OrderStateList = array
        }else{
            self.OrderStateList = array
        }
        
    }
    
    func loadOrderDetail(completion:@escaping (Bool)->()){
        let singleton = Singleton.sharedInstance()
        print(singleton.text)
        let urlstring = "http://www.yunprint.com/api/cse49910p/myorders/uid/chengyong"
        WYNetworkManager.shared.orderDetailList(URLString: urlstring) { (list,isSuccess) in
            var detailList = [[String:AnyObject]]()
            for item in list!{
                if item["state"] as? String == singleton.text{
                    detailList.append(item)
                }
            }
            
            guard let array = NSArray.yy_modelArray(with: WYOrderDetail.self,  json: detailList) as? [WYOrderDetail] else{
                return
            }
            
            self.orderDetail = array
            completion(isSuccess)
        }
    }
}



