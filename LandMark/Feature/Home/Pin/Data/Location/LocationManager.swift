//
//  LocationManager.swift
//  LandMark
//
//  Created by Lucas Migge on 31/10/24.
//

import CoreLocation

protocol LocationManagerProtocol {
    func getCurrentUserLocation() -> LocationCoordinate
}

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject, LocationManagerProtocol {
    private let locationManager = CLLocationManager()
    
    @Published var userCoordinate: LocationCoordinate = .init(latitude: 0, longitude: 0)
    
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    deinit {
        locationManager.stopUpdatingLocation()
    }
    
    func getCurrentUserLocation() -> LocationCoordinate {
        return self.userCoordinate
    }
    
    // MARK: CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.userCoordinate = .init(location: location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Erro ao obter a localização: \(error.localizedDescription)")
    }
}
