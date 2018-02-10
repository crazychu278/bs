//
//  WYMainViewController.swift
//  wy
//
//  Created by chu on 04/02/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildControllers()
        // Do any additional setup after loading the view.
    }

    override var supportedInterfaceOrientations:UIInterfaceOrientationMask{
       
        return .portrait
    }
    
    private func setupChildControllers(){
        let array:[[String:Any]] =
        [
            ["clsName":"WYHomeViewController",
             "title":"首页",
             "imageName":"",
             "visitorInfo":["imageName":"","message":"登陆后查看所有店铺"]],
            
            ["clsName":"WYMapViewController",
             "title":"地图",
             "imageName":"",
             "visitorInfo":["imageName":"","message":"登陆后会显示你附近的打印店"]],
            
            ["clsName":"WYMessageViewController",
             "title":"消息",
             "imageName":"",
             "visitorInfo":["imageName":"visitordiscover_image_message","message":"登陆后会显示你最近的消息"]],
            
            ["clsName":"WYShoppingcartController",
             "title":"购物车",
             "imageName":"",
             "visitorInfo":["imageName":"visitordiscover_feed_image_shoppingcart","message":"登陆后会显示你的购物车"]],
            
            ["clsName":"WYProfileViewController",
             "title":"我的微印",
             "imageName":"",
             "visitorInfo":["imageName":"visitordiscover_image_profile","message":"登陆后会显示你的个人资料"]],
        ]
        
        //转换成 plist
        //(array as NSArray).write(to: "/Users/mac/Desctop/demo.plist", atomically: true)
        
        var arrayM = [UIViewController]()
        
        for dict in array {
            arrayM.append(controller(dict: dict as [String : AnyObject]))
        }
        viewControllers = arrayM
    }
    
    private func controller(dict:[String: AnyObject]) ->UIViewController {
        guard let clsName = dict["clsName"] as? String,
              let title = dict["title"] as? String,
            //let imageName = dict["imageName"],
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName ) as? WYBaseViewController.Type,
            let visitorDict = dict["visitorInfo"] as? [String: String] else {
                return UIViewController();
        }
        //创建视图
        let vc = cls.init()
        vc.title = title
        
        vc.visitorInfoDic = visitorDict
        
        //设置图像
        //vc.tabBarItem.image=UIImage(named:)
        //vc.tabBarItem.selectedImage = UIView(named:)?.withRenderingMode(.alwaysOriginal)
        
        //设置tabbar标题大小
        //vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)],for:UIControlState(rawValue: 0))
        
        
        let nav = WYNavigationController(rootViewController: vc);
        return nav
    }

}

