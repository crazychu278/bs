//
//  WYLoginViewController.swift
//  wy
//
//  Created by chu on 08/04/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYLoginViewController: UIViewController {

    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var password: UILabel!
    
    @IBOutlet weak var usenameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBAction func login(_ sender: Any) {
        usenameText.text = "chengyong"
        passwordText.text = "abc123"
        if (usenameText.text! != "" && passwordText.text! != "") {
            checkIn()
        }else{
            let alertController = UIAlertController(title: "输入不能为空",
                                                    message: nil, preferredStyle: .alert)
            //显示提示框
            self.present(alertController, animated: true, completion: nil)
            //一秒钟后自动消失
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.presentedViewController?.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    
    //"user":{"name":"\u7a0b\u52c7","gender":"M","mobile":"18611176733", "campid":"411101001000","level":"1","balance":"0.00","credit":"18","downticket":"0","create_time":"20 17-10-10 11:10:57","update_time":"2017-10-10 11:10:57"}
    
    var userAccount = [String : AnyObject]()
    

    @objc private func checkIn(){
        let URLString = "http://www.yunprint.com/api/cse49910p/login/uid/" + usenameText.text!+"/pwd/" + passwordText.text!
        WYNetworkManager.shared.request(URLString: URLString, parameters: nil) { (json, isSuccess) in
            if (json!["error"] as?  Bool) == false{
               
                let alertController = UIAlertController(title: "登录成功",
                                                        message: nil, preferredStyle: .alert)
                //显示提示框
                self.present(alertController, animated: true, completion: nil)
                //一秒钟后自动消失
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    self.presentedViewController?.dismiss(animated: false, completion: nil)
                }
                
                let urlstring = "http://www.yunprint.com/api/cse49910p/getuser/uid/" + self.usenameText.text!
                
                print(urlstring)
                
                WYNetworkManager.shared.setUserAccount(URLString: urlstring){ (result,isSuccess) in
                    
                }
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "base"), object: nil)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "map"), object: nil)

                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                    self.dismiss(animated: true, completion: nil)
                }
                
                
            }else{
                let alertController = UIAlertController(title: "密码错误",
                                                        message: nil, preferredStyle: .alert)
                self.present(alertController, animated: true, completion: nil)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    self.presentedViewController?.dismiss(animated: false, completion: nil)
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item=UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.plain, target: self, action: #selector(close))
        
        self.navigationItem.leftBarButtonItem = item
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func close(){
        dismiss(animated: true, completion: nil)
    }
}
