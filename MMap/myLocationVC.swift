//
//  myLocationVC.swift
//  MMap
//
//  Created by Maahi on 27/04/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit
import MapKit


class myLocationVC: UIViewController,CLLocationManagerDelegate ,MKMapViewDelegate{

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var locCordinate = CLLocationCoordinate2D()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager.delegate = self
            
            if CLLocationManager.authorizationStatus() == .notDetermined {
                self.locationManager.requestWhenInUseAuthorization()
            }
            
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            
        }
        else
        {
            #if debug
                println("Location services are not enabled");
            #endif           
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

    
    
    
    private func locationManager(manager: CLLocationManager!, didFailWithError error: Error!)
    {
        locationManager.stopUpdatingLocation()
        if ((error) != nil)
        {
            print(error)
        }
    }
    
    private func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    {
        let locationArray = locations as NSArray
        let locationObj = locationArray.lastObject as! CLLocation
        let coord = locationObj.coordinate
        print(coord.latitude)
        print(coord.longitude)
        
        locCordinate.latitude = coord.latitude
        locCordinate.longitude = coord.longitude
        
        
        
        
        let location = locationObj as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
        

    }
    
    
    
    
}


/*
extension myLocationVC :MKMapViewDelegate{
    
    
    
//    let location = locCordinate as CLLocation
//    
//    let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//    let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//    
//    self.map.setRegion(region, animated: true)
//    
}*/
