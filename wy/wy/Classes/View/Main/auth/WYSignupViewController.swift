//
//  WYSignupViewController.swift
//  wy
//
//  Created by chu on 08/04/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYSignupViewController: UIViewController {

    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var password: UILabel!
    
    @IBOutlet weak var usernameTextFiled: UITextField!
    
    @IBOutlet weak var passwordTextFiled: UITextField!
    
    @IBAction func signup(_ sender: Any) {
        
        
        
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let item=UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.plain, target: self, action: #selector(close))
        
        self.navigationItem.leftBarButtonItem = item
        
        // Do any additional setup after loading the view.
    }

    @objc private func close(){
        dismiss(animated: true, completion: nil)
    }
}
