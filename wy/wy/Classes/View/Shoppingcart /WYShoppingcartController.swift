//
//  WYShoppingcartController.swift
//  wy
//
//  Created by chu on 07/02/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYShoppingcartController: WYBaseViewController {
    
    private let cellId = "cellId"
    
    private lazy var listViewModel = WYStatusListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func loadData() {
        listViewModel.loadShoppingCartStatus(pullup: self.isPullup){ (isSuccess,hasPullup) in
            print("加载结束")
            //结束刷新
            self.refreshControl?.endRefreshing()
            self.isPullup = true
            self.tableView?.reloadData()
        }
        
        
    }

    override func setupTableView() {
        super.setupTableView()


        tableView?.register(UINib(nibName: "WYShoppingCartNormalCell", bundle: nil), forCellReuseIdentifier: cellId)

        //行高

        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 300
        
        //取消分割线
        tableView?.separatorStyle = .none
    }
}



extension WYShoppingcartController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.shoppingCartList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //取cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WYShoppingCartCell

        cell.name.text = listViewModel.shopStatusList[indexPath.row].name
        cell.shopName.text = listViewModel.shopStatusList[indexPath.row].shopname
        cell.blindprice.text = listViewModel.shopStatusList[indexPath.row].blindprice
        cell.numbers.text = listViewModel.shopStatusList[indexPath.row].number

        return cell
    }
}

