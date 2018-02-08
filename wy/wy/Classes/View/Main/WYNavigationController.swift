//
//  WYNavigationController.swift
//  wy
//
//  Created by chu on 04/02/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
            if let vc = viewController as? WYBaseViewController {
                var title = "返回"
                if childViewControllers.count == 1{
                    title = childViewControllers.first?.title ?? "返回"
                }
                //isback true
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(back))
            
            }
        }
        super.pushViewController(viewController, animated: true)
    }
    
    @objc private func back(){
        popViewController(animated: true)
    }

}
