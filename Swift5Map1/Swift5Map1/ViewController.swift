//
//  ViewController.swift
//  Swift5Map1
//
//  Created by 木村和貴 on 2018/12/19.
//  Copyright © 2018 kazuki kimura. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //東京タワーの位置情報
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(35.658581, 139.745433)
        
        //mapViewの中心を決める
        mapView.setCenter(location, animated: true)

        //縮尺
        var region:MKCoordinateRegion = mapView.region
        region.center = location
        //設定しないと地図の表示が再縮小されたお状態でマップがひ表示されるので、理由がない限りは設定した方がいい
        region.span.latitudeDelta = 0.02
        region.span.longitudeDelta = 0.02
        
        mapView.setRegion(region, animated: true)
        
        mapView.mapType = .hybrid
        
        mapView.delegate = self
        
        //mapViewのピンをどこに留めるのか
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(location.latitude
            , location.longitude)
        
        annotation.title = "東京タワー"
        //ピンを打つ
        mapView.addAnnotation(annotation)
        
        
    }

    @IBAction func reload(_ sender: Any) {
        
        //countによってmapを変える
        count = count + 1
        
        if count == 1{
            mapView.mapType = .standard
        }else if count == 2{
            
            mapView.mapType = .hybridFlyover
        }else if count == 3{
            
            mapView.mapType = .mutedStandard
        }else if count == 4{
            
            mapView.mapType = .satellite
        }else if count == 5{
            
            mapView.mapType = .satelliteFlyover
        }else if count == 6{
            
            mapView.mapType = .hybrid
            count = 0
        }
        
    }
    
}

