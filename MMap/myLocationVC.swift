//
//  myLocationVC.swift
//  MMap
//
//  Created by Maahi on 27/04/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class myLocationVC: UIViewController,CLLocationManagerDelegate ,MKMapViewDelegate{

    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var locCordinate = CLLocationCoordinate2D()
    var locationStatus = String()
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        
        /*if (CLLocationManager.locationServicesEnabled())
        {
            
            locationManager = CLLocationManager()
            locationManager.delegate = self
            
            //if CLLocationManager.authorizationStatus() == .notDetermined {
              //  self.locationManager.requestWhenInUseAuthorization()
           // }
            
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
          //  locationManager.startMonitoringSignificantLocationChanges()
        }
        else
        {
            #if debug
                println("Location services are not enabled");
            #endif           
        }
        */
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            self.locationManager.requestWhenInUseAuthorization()
        }
        locationManager.delegate = self;
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
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
    
   
    
    
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0]
        let long = userLocation.coordinate.longitude;
        let lat = userLocation.coordinate.latitude;
        
        print(long, lat)
        
        
        
        let locationArray = locations as NSArray
        let locationObj = locationArray.lastObject as! CLLocation
        let coord = locationObj.coordinate
        print(coord.latitude)
        print(coord.longitude)
        
        locCordinate.latitude = coord.latitude
        locCordinate.longitude = coord.longitude
        
        
        locationManager.stopUpdatingLocation()
        
        let location = locationObj as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
        
        
        
        // Add below code to get address for touch coordinates.
        let geoCoder = CLGeocoder()
        //let location = CLLocation(latitude: center.latitude, longitude: center.longitude)
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            
            // Place details
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            
            
            var Add = NSMutableString ()
            // Address dictionary
            print(placeMark.addressDictionary as Any)
            
            // Location name
            if let locationName = placeMark.addressDictionary!["Name"] as? NSString {
                print(locationName)
                Add.append(" \(locationName as String)")
            }
            // Street address
            if let street = placeMark.addressDictionary!["Thoroughfare"] as? NSString {
                print(street)
                Add.append(" \(street as String)")
            }
            // City
            if let city = placeMark.addressDictionary!["City"] as? NSString {
                print(city)
                Add.append(" \(city as String)")
            }
            // Zip code
            if let zip = placeMark.addressDictionary!["ZIP"] as? NSString {
                print(zip)
            }
            // Country
            if let country = placeMark.addressDictionary!["Country"] as? NSString {
                print(country)
            }
            
            
            
            var anoatation = MKPointAnnotation()
            anoatation.coordinate = center
            anoatation.title = Add as String
            if let country = placeMark.addressDictionary!["Country"] as? NSString {
               anoatation.subtitle = country as String
            }
            
            self.mapView.addAnnotation(anoatation)
            
        })
        
        
        
        
        
        
        
        
        
        
        //Do What ever you want with it
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




func didLongPressMap(sender: UILongPressGestureRecognizer) {
    
    if sender.state == UIGestureRecognizerState.began {
        let touchPoint = sender.location(in: mapView)
        let touchCoordinate = mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = touchCoordinate
        annotation.title = "Your position"
        mapView.addAnnotation(annotation) //drops the pin
        print("lat:  \(touchCoordinate.latitude)")
        let num = touchCoordinate.latitude as NSNumber
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 4
        formatter.minimumFractionDigits = 4
        let str = formatter.string(from: num)
        print("long: \(touchCoordinate.longitude)")
        let num1 = touchCoordinate.longitude as NSNumber
        let formatter1 = NumberFormatter()
        formatter1.maximumFractionDigits = 4
        formatter1.minimumFractionDigits = 4
        let str1 = formatter1.string(from: num1)
       let adressLoLa = "\(num),\(num1)"
        
        // Add below code to get address for touch coordinates.
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: touchCoordinate.latitude, longitude: touchCoordinate.longitude)
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            
            // Place details
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            
            // Address dictionary
            print(placeMark.addressDictionary as Any)
            
            // Location name
            if let locationName = placeMark.addressDictionary!["Name"] as? NSString {
                print(locationName)
            }
            // Street address
            if let street = placeMark.addressDictionary!["Thoroughfare"] as? NSString {
                print(street)
            }
            // City
            if let city = placeMark.addressDictionary!["City"] as? NSString {
                print(city)
            }
            // Zip code
            if let zip = placeMark.addressDictionary!["ZIP"] as? NSString {
                print(zip)
            }
            // Country
            if let country = placeMark.addressDictionary!["Country"] as? NSString {
                print(country)
            }
        })
    }
}



}
