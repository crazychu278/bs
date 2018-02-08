//
//  WYHomeViewController.swift
//  wy
//
//  Created by chu on 04/02/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYHomeViewController: WYBaseViewController {

    private lazy var statusList = [String]()
    private let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    @objc private func showfrends(){
        let vc = WYDemoViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    override func setupUI() {
        super.setupUI()
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "11", style: UIBarButtonItemStyle.plain, target: self, action: #selector(showfrends))
        navItem.leftBarButtonItem = UIBarButtonItem(title: "菜单", fontSize: 16, target: self, action: #selector(showfrends))
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    override func loadData() {
        for i in 0..<15 {
            statusList.insert(i.description, at: 0)
        }
    }
   

}

extension WYHomeViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = statusList[indexPath.row]
        
        return cell
    }
}
