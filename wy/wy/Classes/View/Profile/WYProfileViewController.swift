//
//  WYProfileViewController.swift
//  wy
//
//  Created by chu on 04/02/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYProfileViewController: WYBaseViewController {

    private lazy var listViewModel = WYStatusListViewModel()
    
    private let cellId = "cellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //NotificationCenter.default.addObserver(self, selector: #selector(getDetail), name: NSNotification.Name(rawValue: "getOrderDetail"), object: nil)
    }

    
    
    @objc private func setInformation(){
        let nav = UINavigationController(rootViewController: WYEditProfileController())
        present(nav,animated: true,completion: nil)
    }
    
    override func loadData() {
        listViewModel.loadOrderStatus(pullup: self.isPullup){ (isSuccess,hasPullup) in
            print("加载结束")
            //结束刷新
            self.refreshControl?.endRefreshing()
            self.isPullup = true
            self.tableView?.reloadData()
        }
        
        
    }
    
    override func setupTableView() {
        super.setupTableView()

        navItem.rightBarButtonItem = UIBarButtonItem(title: "修改个人信息", fontSize: 16, target: self, action: #selector(setInformation))
        
        tableView?.register(UINib(nibName: "WYOrderCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        tableView?.rowHeight = UITableViewAutomaticDimension
        
        tableView?.estimatedRowHeight = 50
        
        //取消分割线
        tableView?.separatorStyle = .none
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //getOrderDetail
    ///////
    //////
    /////
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.item)
        
        //listViewModel.setStatus(sta: String(indexPath.item+1))
        
        let singleton = Singleton.sharedInstance()
        
        singleton.text = (String(indexPath.item+1))
        
        
        let nav = UINavigationController(rootViewController: WYDetailController())
        
        //界面跳转
        self.present(nav, animated:true, completion:nil)
        
        
    }

}

extension WYProfileViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.orderList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //取cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WYOrderCell
        
        cell.status.text = listViewModel.OrderStateList[indexPath.row].status
        return cell
    }
    
    
}
protocol loadingDeleagte {
    func didLoading(text: String)
}
