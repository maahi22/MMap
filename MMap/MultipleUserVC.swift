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
        
        
        
        
        
        
        var annotation = AmoatPoint(latitude: 28.7041, longitude: 77.1025)
        annotation.title = "Delhi"
        latlongArray.add(annotation)
        
        
        let region = MKCoordinateRegion(center: (annotation as MKAnnotation).coordinate, span: MKCoordinateSpan(latitudeDelta: 22.12, longitudeDelta: 22.12))
        
        
        
        
        annotation = AmoatPoint(latitude: 19.0760, longitude: 72.8777)
        annotation.title = "mumbai"
        latlongArray.add(annotation)
        
         annotation = AmoatPoint(latitude: 28.9931, longitude: 77.01515)
        annotation.title = "sonipat"
        latlongArray.add(annotation)
        
         annotation = AmoatPoint(latitude: 31.1048, longitude: 77.1734)
        annotation.title = "shimla"
        latlongArray.add(annotation)
        
         annotation = AmoatPoint(latitude: 29.9457, longitude: 78.1642)
        annotation.title = "haridwar"
        latlongArray.add(annotation)
        
         annotation = AmoatPoint(latitude: 28.4595, longitude: 77.0266)
        annotation.title = "gurgaon"
        latlongArray.add(annotation)
        
        
       /* point1.coordinate = CLLocationCoordinate2DMake(28.7041, 77.1025)
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
        
        */
        var a = 0
        
        for anotation in latlongArray {
            mapView.addAnnotation(anotation as! MKAnnotation)
            mapView.centerCoordinate = point2.coordinate
            mapView.delegate = self
            
            
           /* if(a==0) {
            
                let region = MKCoordinateRegion(center: (anotation as! MKAnnotation).coordinate, span: MKCoordinateSpan(latitudeDelta: 22.12, longitudeDelta: 22.12))
                 mapView.setRegion(region, animated: true)
                
                a = a+1
            }*/
            
           // span.latitudeDelta = 0.015;
           // span.longitudeDelta = 0.015;
           
            
            
            
        
        }
        //mapView.setRegion(region, animated: true)
        
        
        
        
        mapView.delegate = self
        // Connect all the mappoints using Poly line.
        var points: [CLLocationCoordinate2D] = [CLLocationCoordinate2D]()
        for annotation in latlongArray {
            points.append((annotation as AnyObject).coordinate)
        }
        
        let polyline = MKPolyline(coordinates: &points, count: points.count)
        mapView.add(polyline)
        
        
        
        
        
        
        
        
        
        
        var zoomRect: MKMapRect = MKMapRectNull
        for annotation in mapView.annotations {
            let annotationPoint = MKMapPointForCoordinate(annotation.coordinate)
            let pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 2.01, 2.01)
            zoomRect = MKMapRectUnion(zoomRect, pointRect)
        }
        mapView.setVisibleMapRect(zoomRect, animated: true)
        
        
        
        
        
    }

    
    
    
    
    
    
    
    
    
    
    
    //MARK:- MapViewDelegate methods
    
     func mapView(_ mapView: MKMapView,
                          rendererFor overlay: MKOverlay) -> MKOverlayRenderer

    {
        
        if overlay is MKPolyline {
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.blue
            polylineRenderer.lineWidth = 5
            return polylineRenderer
        }
            
           return MKPolylineRenderer ()
        
        
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
