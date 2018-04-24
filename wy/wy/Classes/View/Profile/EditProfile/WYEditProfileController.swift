//
//  WYEditProfileController.swift
//  wy
//
//  Created by chu on 23/04/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit
import YYModel
private let accountFile: NSString = "useraccount.json"
class WYEditProfileController: UIViewController {

    @IBOutlet weak var avator: UIImageView!
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var mobile: UITextField!
    
    @IBOutlet weak var univercity: UITextField!
    
    @IBOutlet weak var major: UITextField!
    
    @IBOutlet weak var level: UILabel!
    
    @IBAction func saveUserAccount(_ sender: Any) {
        
        userAc["loginpw"] = password.text
        userAc["mobile"] = mobile.text
        userAc["college"] = univercity.text
        userAc["major"] = major.text
        
        
        let alertController = UIAlertController(title: "修改成功",message: nil, preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
        
        password.text = ""
        
        univercity.text = userAc["college"]
        
        major.text = userAc["major"]
        
        mobile.text = userAc["mobile"]
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.presentedViewController?.dismiss(animated: false, completion: nil)
        }
        saveAc()
    }
    // vuserAccount.yy_modelSet(with: (json as? [String: AnyObject]) ?? [:])
   // self.userAccount.saveAccount()
    var userAc = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item=UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.plain, target: self, action: #selector(close))
        
        self.navigationItem.leftBarButtonItem = item
        
        getInformation()
        
        username.text = userAc["name"]
        
        avator.image = UIImage(named: "user")
        
        password.text = ""
        
        univercity.text = userAc["college"]
        
        major.text = userAc["major"]
        
        level.text = "等级:" + userAc["level"]!
        
        mobile.text = userAc["mobile"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc private func close(){
        dismiss(animated: true, completion: nil)
    }

    @objc private func getInformation(){
        //加载保存文件
        guard let path = accountFile.cz_appendDocumentDir(),
            let data = NSData(contentsOfFile: path),
            let dict = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [String:AnyObject] else{
                return
        }
        userAc = dict as! [String:String]
        print(userAc)
    }
    
    @objc private func saveAc(){
        let userAccount = WYUserAccount()
        userAccount.yy_modelSet(with: (userAc as! [String: AnyObject]))
        userAccount.saveAccount()
    }
    
}
