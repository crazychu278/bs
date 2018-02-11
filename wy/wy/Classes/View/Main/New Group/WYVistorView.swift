//
//  WYVistorView.swift
//  wy
//
//  Created by chu on 10/02/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

class WYVistorView: UIView {
    
    var visitorInfo: [String: String]?{
        didSet{
            // 使用字典设置访问视图信息 [imageName / message]
            // 取字典信息
            guard let imageName = visitorInfo?["imageName"],
                  let message = visitorInfo?["message"] else {
                    return
            }
            
            //设置消息
            tipLabel.text = message
            
            
            //设置图像
            if imageName == "" {
                startAnimation()
                return
            }
            
            
            //其他视图不显示小房子 和  遮罩视图
            iconView.image = UIImage(named: imageName)
            houseView.isHidden = true
            maskIconView.isHidden = true
        }
    }
    
    // MARK: - 构造属性
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init error")
    }

    private func startAnimation(){
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        //旋转一周
        animation.toValue = 2 * Double.pi
        //旋转次数
        animation.repeatCount = MAXFLOAT
        //旋转一周时间
        animation.duration = 15
        //完成之后不删除 iconView 删除后也会被销毁
        animation.isRemovedOnCompletion = false
        iconView.layer.add(animation, forKey: nil)
    }

    
    
    
    
    // MARK: - 私有空间
    // 图像视图
    private lazy var iconView:UIImageView = UIImageView(image:UIImage(named:"visitordiscover_feed_image_smallicon"))
    
    // 遮罩图像
    private lazy var maskIconView: UIImageView = UIImageView(image: UIImage(named:"visitordiscover_feed_mask_smallicon"))
    
    // 小房子
    private lazy var houseView:UIImageView = UIImageView(image:UIImage(named:"visitordiscover_feed_image_house"))
    
    // 提示标签
    private lazy var tipLabel:UILabel = UILabel.cz_label(withText: "登陆之后可以查看更多内容", fontSize: 16, color: UIColor.darkGray)
    
    // 注册按钮
    private lazy var registerButton: UIButton = UIButton.cz_textButton("注册", fontSize: 16, normalColor: UIColor.orange, highlightedColor: UIColor.black, backgroundImageName: "common_button_white_disable")
    
    // 登陆按钮
    private lazy var loginButton: UIButton = UIButton.cz_textButton("登陆", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.black, backgroundImageName: "common_button_white_disable")
    
}


extension WYVistorView{
    func setupUI() {
        backgroundColor = UIColor.cz_color(withHex: 0xEDEDED)
        
        
        //添加
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(houseView)
        addSubview(tipLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        
        tipLabel.textAlignment = .center
        
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
        
        
        //遮罩图像
        //view VFL的控件名称和实际名称的关系
        let viewDict:[String : Any] = ["maskIconView" : maskIconView,
                                       "registerButton" : registerButton]
        //metrics 常数映射关系
        let metricsDict = ["spacing" : -20]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[maskIconView]-0-|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: viewDict))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[maskIconView]-(spacing)-[registerButton]",
                                                      options: [],
                                                      metrics: metricsDict,
                                                      views: viewDict))
        
    }
}
