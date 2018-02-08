//
//  WYHomeViewController.swift
//  wy
//
//  Created by chu on 04/02/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYHomeViewController: WYBaseViewController {

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
        navItem.leftBarButtonItem = UIBarButtonItem(title: "11", fontSize: 16, target: self, action: #selector(showfrends))
        
    }
   

}

