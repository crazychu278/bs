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
        loadData()
        
        // Do any additional setup after loading the view.
    }
    
    
    override var title: String?{
        didSet{
            navItem.title = title
        }
    }
    
    func loadData() {
        
    }
    
    func setupUI(){
        //添加导航条
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
        
        //设置 navbar 渲染颜色
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        
        //设置navBar字体颜色
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.darkGray]
        
        setupTableView()
    }
    
    //设置表格视图
    private func setupTableView(){
        tableView = UITableView(frame: view.bounds,style:.plain)
        //
        view.insertSubview(tableView!, belowSubview: navigationBar)
        
        //设置数据源 + 代理   子类实现数据源方法
        tableView?.dataSource = self
        tableView?.delegate = self
    }
}



extension WYBaseViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    //父类准备方法 子类负责实现
    //子类数据源不用写super
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
