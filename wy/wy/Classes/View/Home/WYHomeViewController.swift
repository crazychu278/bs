//
//  WYHomeViewController.swift
//  wy
//
//  Created by chu on 04/02/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYHomeViewController: WYBaseViewController {

    private lazy var listViewModel = WYStatusListViewModel()
    
    private let cellId = "cellId"
    
    override func loadData() {
        listViewModel.loadStatus(pullup: self.isPullup){ (isSuccess,hasPullup) in
            print("加载结束")
            //结束刷新
            self.refreshControl?.endRefreshing()
            self.isPullup = true
            self.tableView?.reloadData()
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc private func showfrends(){
        let vc = WYDemoViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func setupTableView() {
        super.setupTableView()
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "11", style: UIBarButtonItemStyle.plain, target: self, action: #selector(showfrends))
        navItem.leftBarButtonItem = UIBarButtonItem(title: "菜单", fontSize: 16, target: self, action: #selector(showfrends))
        
        //tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView?.register(UINib(nibName: "WYstatusNormalCell", bundle: nil), forCellReuseIdentifier: cellId)
    
        //行高
        
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 300
    
        //取消分割线
        tableView?.separatorStyle = .none
    }
    
   

}

extension WYHomeViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //取cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WYStatusCell
        
        cell.shopname.text = listViewModel.statusList[indexPath.row].name

        return cell
    }
}
