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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupChildControllers(){
        let array = [
            ["clsName":"WYHomeViewController","title":"首页","imageName":""],
            ["clsName":"WYMapViewController","title":"地图","imageName":""],
            ["clsName":"WYMessageViewController","title":"消息","imageName":""],
            ["clsName":"WYShoppingcartController","title":"购物车","imageName":""],
            ["clsName":"WYProfileViewController","title":"我的微印","imageName":""],
            ]
        var arrayM = [UIViewController]()
        
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        viewControllers = arrayM
    }
    
    private func controller(dict:[String: String]) ->UIViewController {
        guard let clsName = dict["clsName"],
            let title = dict["title"],
            //let imageName = dict["imageName"],
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName ) as? UIViewController.Type
            else {
                return UIViewController();
        }
        //创建视图
        let vc = cls.init()
        vc.title = title
        
        //设置图像
        //vc.tabBarItem.image=UIImage(named:)
        //vc.tabBarItem.selectedImage = UIView(named:)?.withRenderingMode(.alwaysOriginal)
        
        //设置tabbar标题大小
        //vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)],for:UIControlState(rawValue: 0))
        
        
        let nav = WYNavigationController(rootViewController: vc);
        return nav
    }

}

