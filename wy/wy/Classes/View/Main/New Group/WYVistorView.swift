//
//  WYVistorView.swift
//  wy
//
//  Created by chu on 10/02/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYVistorView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init error")
    }

}


extension WYVistorView{
    func setupUI() {
        backgroundColor = UIColor.white
    }
}
