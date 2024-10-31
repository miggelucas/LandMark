//
//  PinListViewModel.swift
//  LandMark
//
//  Created by Lucas Migge on 31/10/24.
//

import SwiftUI

extension PinListView {
    class ViewModel: ObservableObject {
        
        @Published var pins: [Pin] = []
        
        var locationManager: LocationManagerProtocol
        
        init(locationManager: LocationManagerProtocol = LocationManager()) {
            self.locationManager = locationManager
        }
        
        func didTapOnPinButton() {
            let location = locationManager.getCurrentUserLocation()
            
            let newPin = Pin(id: UUID(), createdAt: .now, latitude: location.latitude, longitude: location.longitude)
            self.pins.append(newPin)
        }
    }
}
