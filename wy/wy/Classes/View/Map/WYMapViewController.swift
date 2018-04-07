//
//  WYMapViewController.swift
//  wy
//
//  Created by chu on 07/02/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit
let APIKey = "97d66929f02d013664dab3110805ea70"
var geodesicCoords = [CLLocationCoordinate2D]()
class WYMapViewController: WYBaseViewController {

    private var place = [
//                         ["恒优速达复印",["longitude":116.420115,"latitude":39.971764]],
//                         ["文印服务部",["longitude":116.420115,"latitude":39.971764]],
//                         ["好好来复印打印",["longitude":116.420115,"latitude":39.971764]],
//                         ["新光数码快印",["longitude":116.420115,"latitude":39.971764]],
//                         ["胜古网吧打印复印",["longitude":116.420115,"latitude":39.971764]],
        
                         
                         ["name":"科技楼东复印店","longitude":116.422169,"latitude":39.973095],
                         ["name":"图书馆文印室","longitude":116.421062,"latitude":39.971603],
                         ["name":"华彩快印店","longitude":116.420115,"latitude":39.971764],
                        ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func setupTableView() {
        
        
        let mapView = MAMapView(frame: CGRect(x: 0, y: 64, width: self.view.bounds.width,height: self.view.bounds.height-49-64))
        
        //let mapView = MAMapView(frame: self.view.bounds)
        AMapServices.shared().apiKey = "8c30a0a7546e8d8b252c735da0a9199e"
        
        AMapServices.shared().enableHTTPS = true
        
//        let pointAnnotation = MAPointAnnotation()
//        pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: 39.979590, longitude: 116.352792)
//        pointAnnotation.title = "方恒国际"
//        pointAnnotation.subtitle = "阜通东大街6号"
//        mapView.addAnnotation(pointAnnotation)
        
        
        mapView.delegate = self as? MAMapViewDelegate
        mapView.isShowsUserLocation = true
        mapView.userTrackingMode = .follow
        view.insertSubview(mapView, belowSubview: navigationBar)
        
        
        for item in place{
            let pointAnnotation = MAPointAnnotation()
            pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: item["longitude"] as! CLLocationDegrees, longitude: item["latitude"] as! CLLocationDegrees)
            pointAnnotation.title = item["name"] as! String
            //pointAnnotation.subtitle = "阜通东大街6号"
            mapView.addAnnotation(pointAnnotation)
        }
        
        
        
        
    }
    
    
    
    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView! {
        
        if annotation.isKind(of: MAPointAnnotation.self) {
            let pointReuseIndetifier = "pointReuseIndetifier"
            var annotationView: MAAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: pointReuseIndetifier)
            
            if annotationView == nil {
                annotationView = MAAnnotationView(annotation: annotation, reuseIdentifier: pointReuseIndetifier)
            }
            
            annotationView!.image = UIImage(named: "restaurant")
            //设置中心点偏移，使得标注底部中间点成为经纬度对应点
            //annotationView!.centerOffset = CGPoint(0, -18);
            
            return annotationView!
        }
        
        return nil
    }
}
