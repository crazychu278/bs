//
//  WYDetailController.swift
//  wy
//
//  Created by chu on 18/04/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYDetailController1: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //private let cellId = "cellId"
    
    var tableView: UITableView?
    
    private lazy var listViewModel = WYStatusListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loadData(url: "")
        
        let item = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.plain, target: self, action: #selector(close))
        
        navigationItem.leftBarButtonItem = item
        
        tableView = UITableView(frame: view.bounds,style:.plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        
        
        tableView?.register(UINib(nibName: "WYDetailCell", bundle: nil), forCellReuseIdentifier: "WYDetailCell")
        //tableView?.register(WYDetailCell, forCellReuseIdentifier: "mycell")
        //行高
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 50
        
        tableView?.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        
        tableView?.scrollIndicatorInsets = tableView!.contentInset
        
        //取消分割线
        tableView?.separatorStyle = .none
        
        view.addSubview(self.tableView!)
        
        //view.bringSubview(toFront: tableView!)
        
    }
    
//
//    func setupUI() {
//
//        let item = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.plain, target: self, action: #selector(close))
//
//        navigationItem.leftBarButtonItem = item
//
//        tableView = UITableView(frame: view.bounds,style:.plain)
//        tableView?.delegate = self
//        tableView?.dataSource = self
//
//
//        tableView?.register(UINib(nibName: "WYDetailCell", bundle: nil), forCellReuseIdentifier: "mycell")
//        //tableView?.register(WYDetailCell, forCellReuseIdentifier: "mycell")
//        //行高
//        tableView?.rowHeight = UITableViewAutomaticDimension
//        tableView?.estimatedRowHeight = 50
//
//        tableView?.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
//
//        tableView?.scrollIndicatorInsets = tableView!.contentInset
//
//        //取消分割线
//        tableView?.separatorStyle = .none
//
//        view.addSubview(self.tableView!)
//
//        //view.bringSubview(toFront: tableView!)
//
//
//
//    }
    
    func loadData(url:String) {
        listViewModel.loadOrderDetail(state: "1"){ (issuccess,true) in
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func close(){
        dismiss(animated: true, completion: nil)
    }


     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.orderDetail.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //取cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "WYDetailCell", for: indexPath) as! WYOrderDetailCell
        
        
        cell.oid.text = listViewModel.orderDetail[indexPath.row].oid
        cell.uid.text = listViewModel.orderDetail[indexPath.row].uid
        //cell.dest.text = listViewModel.orderDetail[indexPath.row].dest
        cell.filenum.text = listViewModel.orderDetail[indexPath.row].filenum
        cell.takepw.text = listViewModel.orderDetail[indexPath.row].takepw
        cell.state.text = listViewModel.orderDetail[indexPath.row].state
        //cell.totalamount.text = listViewModel.orderDetail[indexPath.row].totalamount
        print("table")
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }

}
