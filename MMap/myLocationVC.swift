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
   
    var locationStatus = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        
        if (CLLocationManager.locationServicesEnabled())
        {
            
            locationManager = CLLocationManager()
            locationManager.delegate = self
            
            //if CLLocationManager.authorizationStatus() == .notDetermined {
              //  self.locationManager.requestWhenInUseAuthorization()
           // }
            
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            locationManager.startMonitoringSignificantLocationChanges()
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

    
    
    
     func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        //locationManager.stopUpdatingLocation()
        if ((error) != nil)
        {
            print(error)
        }
    }
    
      func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
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
    
//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//        
//        var locValue:CLLocationCoordinate2D = manager.location!.coordinate
//        
//        println("locations = \(locValue.latitude) \(locValue.longitude)")
//        
//    }
    
    
    private func locationManager(manager: CLLocationManager!,
                         didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        var shouldIAllow = false
        
        switch status {
        case CLAuthorizationStatus.restricted:
            locationStatus = "Restricted Access to location"
        case CLAuthorizationStatus.denied:
            locationStatus = "User denied access to location"
        case CLAuthorizationStatus.notDetermined:
            locationStatus = "Status not determined"
        default:
            locationStatus = "Allowed to location Access"
            shouldIAllow = true
        }
      //  NotificationCenter.defaultCenter().postNotificationName("LabelHasbeenUpdated", object: nil)
        if (shouldIAllow == true) {
            NSLog("Location to Allowed")
            // Start location services
            locationManager.startUpdatingLocation()
        } else {
            NSLog("Denied access: \(locationStatus)")
        }
    }
    
    
    
    
    
    
    
    @IBAction func openLocation(_ sender: AnyObject) {
        
        
        locationManager.startUpdatingLocation()
        
        
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
