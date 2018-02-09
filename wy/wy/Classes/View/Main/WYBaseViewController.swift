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
    
    
    //刷新控件
    var refreshControl:UIRefreshControl?
    
    //区分上拉刷新标记
    var isPullup = false
    
    
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64))
    
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
    
    @objc func loadData() {
        refreshControl?.endRefreshing()
    }
    
    func setupUI(){
        //添加导航条
        
        automaticallyAdjustsScrollViewInsets = false
    
        
        setupNavigationBar()
        
        setupTableView()
    }
    
    private func setupNavigationBar(){
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
        //
        view.insertSubview(tableView!, belowSubview: navigationBar)
        
        //设置数据源 + 代理   子类实现数据源方法
        tableView?.dataSource = self
        tableView?.delegate = self
        
        //设置内容缩进
        tableView?.contentInset = UIEdgeInsets(top: navigationBar.bounds.height, left: 0, bottom: tabBarController?.tabBar.bounds.height ?? 49, right: 0)
        
        
        
        
        
        //添加刷新控件
        //刷新控件
        //实例化
        refreshControl = UIRefreshControl()
        
        //添加到tableView
        tableView?.addSubview(refreshControl!)
        
        //添加监听方法
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
        
        
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
    
    
    //在显示最后一行显示下拉刷新
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //判断是不是最后一行
        //row
        let row = indexPath.row
        
        //section
        let section = tableView.numberOfSections - 1
        
        if row < 0 || section < 0 {
            return
        }
        
        let count = tableView.numberOfRows(inSection: section)
        
        if row == (count - 1) && !isPullup {
            isPullup = true
            loadData()
        }
        
    }
    
    
}
