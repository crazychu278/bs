//
//  WYBaseViewController.swift
//  wy
//
//  Created by chu on 04/02/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYBaseViewController: UIViewController {
    //UIScreen.main.bounds.size.width
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: 65))
    
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    
    override var title: String?{
        didSet{
            navItem.title = title
        }
    }
    
    func setupUI(){
        //添加导航条
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
        //navigationBar.barTintColor = UIColor
        
        //设置navBar字体颜色
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.darkGray]
    }
    
    
    

}

