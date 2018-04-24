//
//  WYDetailController.swift
//  wy
//
//  Created by chu on 20/04/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYDetailController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView?
    
    var state: String = ""
    //private let cellId = "cellId"
    
    private lazy var listViewModel = WYStatusListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.plain, target: self, action: #selector(close))
        
        navigationItem.leftBarButtonItem = item
        loadData(url: "")

        
        
        //tableView?.register(UINib(nibName: "WYDetailCell", bundle: nil), forCellReuseIdentifier: cellId)
        // Do any additional setup after loading the view.
    }

    func loadData(url:String) {
        listViewModel.loadOrderDetail{ (issuccess) in
            self.tableView = UITableView(frame: self.view.bounds,style:.plain)
            self.tableView?.delegate = self
            self.tableView?.dataSource = self
            self.tableView?.register(UINib(nibName: "WYOrderDetailCell", bundle: nil), forCellReuseIdentifier: "WYOrderDetailCell")
            
            self.tableView?.rowHeight = UITableViewAutomaticDimension
            self.tableView?.estimatedRowHeight = 200
            
            //self.tableView?.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
            
            self.tableView?.scrollIndicatorInsets = self.tableView!.contentInset
            
            //取消分割线
            self.tableView?.separatorStyle = .none
            
            self.view.addSubview(self.tableView!)
        
        
        }
    }
    
    @objc private func close(){
        dismiss(animated: true, completion: nil)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.orderDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WYOrderDetailCell", for: indexPath) as! WYOrderDetailCell
        //let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WYOrderDetailCell

        
        cell.oid.text = "订单号:"+listViewModel.orderDetail[indexPath.row].oid!
        
        cell.filenum.text = "页数:"+listViewModel.orderDetail[indexPath.row].filenum!
        cell.takepw.text = "取货密码:"+listViewModel.orderDetail[indexPath.row].takepw!
        cell.state.text = "状态:"+listViewModel.orderDetail[indexPath.row].state!
        //cell.totalamount.text = listViewModel.orderDetail[indexPath.row].totalamount
        return cell
    }
}

extension WYDetailController : loadingDeleagte {
    
    func didLoading(text: String) {
        state = text
        print(state)
        
    }
}
