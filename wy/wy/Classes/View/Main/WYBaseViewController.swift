//
//  WYBaseViewController.swift
//  wy
//
//  Created by chu on 04/02/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYBaseViewController: UIViewController {
    
    //表格视图
    var tableView:UITableView?
    
    
    
    
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: 65))
    
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
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
        
        //设置 navbar 渲染颜色
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        
        //设置navBar字体颜色
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.darkGray]
        
        
    }
    
    //设置表格视图
    private func setupTableView(){
        tableView = UITableView(frame: view.bounds,style:.plain)
        view.insertSubview(tableView!, belowSubview: navigationBar)
    }
    
    
    

}

