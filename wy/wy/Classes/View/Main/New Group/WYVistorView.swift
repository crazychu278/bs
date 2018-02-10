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

    // MARK: - 私有空间
    // 图像视图
    private lazy var iconView:UIImageView = UIImageView(image:UIImage(named:"visitordiscover_feed_image_smallicon"))
    
    // 小房子
    private lazy var houseView:UIImageView = UIImageView(image:UIImage(named:"visitordiscover_feed_image_house"))
    
    //提示标签
    private lazy var tipLabel:UILabel = UILabel.cz_label(withText: "      登陆之后可以查看更多内容", fontSize: 16, color: UIColor.darkGray)
    
    // 注册按钮
    private lazy var registerButton: UIButton = UIButton.cz_textButton("注册", fontSize: 16, normalColor: UIColor.orange, highlightedColor: UIColor.black, backgroundImageName: "common_button_white_disable")
    
    // 登陆按钮
    private lazy var loginButton: UIButton = UIButton.cz_textButton("登陆", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.black, backgroundImageName: "common_button_white_disable")
    
}


extension WYVistorView{
    func setupUI() {
        backgroundColor = UIColor.white
        
        //添加
        addSubview(iconView)
        addSubview(houseView)
        addSubview(tipLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        
        //取消 autoresizing
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        //自动布局
        let margin:CGFloat = 20.0
        
        //设置中心点
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60))
        
        
        //设置房子
        addConstraint(NSLayoutConstraint(item: houseView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: houseView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60))
        
        
        //设置提示label
        addConstraint(NSLayoutConstraint(item: tipLabel,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: iconView,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0))
        
        addConstraint(NSLayoutConstraint(item: tipLabel,
                                         attribute: .top,
                                         relatedBy:.equal,
                                         toItem: iconView,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: margin))
        
        addConstraint(NSLayoutConstraint(item: tipLabel,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1.0,
                                         constant: 236))
        
        //设置注册按钮
        //左边
        addConstraint(NSLayoutConstraint(item: registerButton,
                                         attribute: .left,
                                         relatedBy:.equal,
                                         toItem: tipLabel,
                                         attribute: .left,
                                         multiplier: 1.0,
                                         constant: 0))
        
        //顶部
        addConstraint(NSLayoutConstraint(item: registerButton,
                                         attribute: .top,
                                         relatedBy:.equal,
                                         toItem: tipLabel,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: margin))
        
        
        
        //宽度
        addConstraint(NSLayoutConstraint(item: registerButton,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1.0,
                                         constant: 100))
        
        //设置登陆按钮
        //顶部
        addConstraint(NSLayoutConstraint(item: loginButton,
                                         attribute: .top,
                                         relatedBy:.equal,
                                         toItem: tipLabel,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: margin))


        //右边
        addConstraint(NSLayoutConstraint(item: loginButton,
                                         attribute: .right,
                                         relatedBy:.equal,
                                         toItem: tipLabel,
                                         attribute: .right,
                                         multiplier: 1.0,
                                         constant: 0))

        //宽度
        addConstraint(NSLayoutConstraint(item: loginButton,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: registerButton,
                                         attribute: .width,
                                         multiplier: 1.0,
                                         constant: 0 ))
        
    }
}
