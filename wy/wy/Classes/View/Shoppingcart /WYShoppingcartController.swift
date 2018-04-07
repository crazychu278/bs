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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func loadData() {
    }
    
    override func setupTableView() {
    }
}



extension WYShoppingcartController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellId.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //取cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WYStatusCell
        
        //cell.text = tableView[indexPath.row]
        
        return cell
    }
}

