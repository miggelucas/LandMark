//
//  LocationCoordinate.swift
//  LandMark
//
//  Created by Lucas Migge on 31/10/24.
//

import CoreLocation

struct LocationCoordinate {
    let latitude: Double
    let longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    init(location: CLLocation) {
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
    }
}
