//
//  AmoatPoint.swift
//  MMap
//
//  Created by Maahi on 26/05/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit
import MapKit

class AmoatPoint: NSObject,MKAnnotation {

    var title: String?
    var subtitle: String?
    var latitude: Double
    var longitude:Double
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
