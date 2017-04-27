//
//  MultipleUserVC.swift
//  MMap
//
//  Created by Maahi on 27/04/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit
import MapKit

class MultipleUserVC: UIViewController,MKMapViewDelegate {

    let latlongArray = NSMutableArray()
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let point1 = MKPointAnnotation()
        let point2 = MKPointAnnotation()
        
        point1.coordinate = CLLocationCoordinate2DMake(28.7041, 77.1025)
        point1.title = "Delhi"
        point1.subtitle = "Delhi"
        latlongArray.add(point1)
        
        point2.coordinate = CLLocationCoordinate2DMake(19.0760, 72.8777)
        point2.title = "mumbai"
        point2.subtitle = "mumbai"
        latlongArray.add(point2)
        
        let point3 = MKPointAnnotation()
        let point4 = MKPointAnnotation()
        point3.coordinate = CLLocationCoordinate2DMake(28.9931, 77.0151)
        point3.title = "sonipat"
        point3.subtitle = "sonipat"
        latlongArray.add(point3)
        
        point4.coordinate = CLLocationCoordinate2DMake(31.1048, 77.1734)
        point4.title = "shimla"
        point4.subtitle = "shimla"
        latlongArray.add(point4)
        
        let point5 = MKPointAnnotation()
        let point6 = MKPointAnnotation()
        point5.coordinate = CLLocationCoordinate2DMake(29.9457, 78.1642)
        point5.title = "haridwar"
        point5.subtitle = "haridwar"
        latlongArray.add(point5)
        
        point6.coordinate = CLLocationCoordinate2DMake(28.4595, 77.0266)
        point6.title = "gurgaon"
        point6.subtitle = "gurgaon"
        latlongArray.add(point6)
        
        let point7 = MKPointAnnotation()
        let point8 = MKPointAnnotation()
        point7.coordinate = CLLocationCoordinate2DMake(29.3909, 76.9635)
        point7.title = "Panipat"
        point7.subtitle = "Panipat"
        latlongArray.add(point7)
        
        point8.coordinate = CLLocationCoordinate2DMake(24.9164, 79.5812)
        point8.title = "chatar pur"
        point8.subtitle = "chatar pur"
        latlongArray.add(point8)
        
        
        for anotation in latlongArray {
            mapView.addAnnotation(anotation as! MKAnnotation)
            mapView.centerCoordinate = point2.coordinate
            mapView.delegate = self
            
            let region = MKCoordinateRegion(center: point5.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.12, longitudeDelta: 0.12))
           // span.latitudeDelta = 0.015;
           // span.longitudeDelta = 0.015;
            mapView.setRegion(region, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension MultipleUserVC : MKMapViewDelegate{
//    
//    
//    
//    
//    
//    
//}
