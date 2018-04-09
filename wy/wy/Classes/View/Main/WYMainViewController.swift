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
        
        
        delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(userLogin), name: NSNotification.Name(rawValue: WYUserShouldLoginNotification), object: nil)
        
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    
    @objc private func userLogin(n:Notification){
        print("用户登陆通知\(n)")
        
        let nav = UINavigationController(rootViewController: WYLoginViewController())
        
        
        present(nav,animated: true,completion: nil)
        
        
    }
    
    
    override var supportedInterfaceOrientations:UIInterfaceOrientationMask{
       
        return .portrait
    }
    
    private func setupChildControllers(){
        //沙盒路径
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let jsonpath = (docDir as NSString).appendingPathComponent("interface.json")
        
        //加载data
        var data = NSData(contentsOfFile: jsonpath)
        
        //
        if data == nil {
            let path =  Bundle.main.path(forResource: "interface.json", ofType: nil)
            data = NSData(contentsOfFile: path!)
        }
        
        //加载json
        guard  let array = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String:Any]] else{
                return
        }
            

        //转换成 plist
        //(array as NSArray).write(to: "/Users/mac/Desctop/demo.plist", atomically: true)
        
        //数组到json 序列化
        //let data = try! JSONSerialization.data(withJSONObject: array, options: [.prettyPrinted])
        //(data as NSData).write(toFile: "/Users/chu/Desktop/interface.json", atomically: true)
        
        var arrayM = [UIViewController]()
        
        for dict in array! {
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

extension WYMainViewController:UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
   
        print("切换到\(viewController)")
        let index = (childViewControllers as NSArray).index(of: viewController)
        if selectedIndex == 0 && index == selectedIndex {
            let nav = childViewControllers[0] as! UINavigationController
            let vc = nav.childViewControllers[0] as! WYHomeViewController
            
            vc.tableView?.setContentOffset(CGPoint(x:0,y:-64), animated: true)
            
            DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
                vc.loadData()
            })
        }
        return !viewController.isMember(of: UIViewController.self)
    }
}

