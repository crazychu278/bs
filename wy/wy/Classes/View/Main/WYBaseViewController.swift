//
//  WYBaseViewController.swift
//  wy
//
//  Created by chu on 04/02/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYBaseViewController: UIViewController {
    
    //是否登陆
    //var isUserLogin = false
    
    static let shared = WYBaseViewController()
    
    //访客视图信息字典
    var visitorInfoDic:[String: String]?
    
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
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(loginSuccess), name: NSNotification.Name(rawValue: "base"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    @objc func loginSuccess(){
        //isUserLogin = true
        print("aaaa")
        
        navItem.leftBarButtonItem = nil
        navItem.rightBarButtonItem = nil
        
        
        //view = nil
        setupUI()
        
        NotificationCenter.default.removeObserver(self)
    }
    override var title: String?{
        didSet{
            navItem.title = title
        }
    }
    
    
    
    @objc func loadData() {
        refreshControl?.endRefreshing()
    }
    
    private func setupUI(){
        //添加导航条
        
        automaticallyAdjustsScrollViewInsets = false
    
        setupNavigationBar()
        
        WYNetworkManager.shared.userLogon ? setupTableView() : setupVisitorView()
    }
    
    private func setupNavigationBar(){
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
        
        //设置 navbar 渲染颜色
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        
        //设置navBar字体颜色
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.darkGray]
        
        //设置系统按钮的文字渲染颜色
        navigationBar.tintColor = UIColor.orange
    }
    
    //设置表格视图
    func setupTableView(){
        tableView = UITableView(frame: view.bounds,style:.plain)
        
        //
        view.insertSubview(tableView!, belowSubview: navigationBar)
        
        //设置数据源 + 代理   子类实现数据源方法
        tableView?.dataSource = self
        tableView?.delegate = self
        
        //设置内容缩进
        tableView?.contentInset = UIEdgeInsets(top: navigationBar.bounds.height, left: 0, bottom: tabBarController?.tabBar.bounds.height ?? 49, right: 0)
        
        tableView?.scrollIndicatorInsets = tableView!.contentInset
        
        
        //添加刷新控件
        //刷新控件
        //实例化
        refreshControl = UIRefreshControl()
        
        //添加到tableView
        tableView?.addSubview(refreshControl!)
        
        //添加监听方法
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)

    }
    
    
    //设置访客视图
    private func setupVisitorView(){
        let visitorView = WYVistorView(frame: view.bounds)
        view.insertSubview(visitorView, belowSubview: navigationBar)
        visitorView.visitorInfo = visitorInfoDic;
        
        visitorView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        visitorView.registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        
        navItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(register))
    
        navItem.rightBarButtonItem = UIBarButtonItem(title: "登陆", style: .plain, target: self, action: #selector(login))
        
        
    }
    
}


extension WYBaseViewController{
    
    @objc private func login(){
//        let nav = UINavigationController(rootViewController: WYLoginViewController())
//        //界面跳转
//        self.present(nav, animated:true, completion:nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: WYUserShouldLoginNotification), object: nil)
        
    }
    @objc private func register(){
        let nav = UINavigationController(rootViewController: WYSignupViewController())
        //界面跳转
        self.present(nav, animated:true, completion:nil)
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


