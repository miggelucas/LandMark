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
        
        let coordinator: CoordinatorProtocol
        let locationManager: LocationManagerProtocol
        let pinRepository: PinRepositoryProtocol
        
        init(coordinator: CoordinatorProtocol, locationManager: LocationManagerProtocol = LocationManager(), pinRepository: PinRepositoryProtocol = PinRepository()) {
            self.coordinator = coordinator
            self.locationManager = locationManager
            self.pinRepository = pinRepository
            
            self.loadPins()
        }
        
        func didTapOnPinButton() {
            let location = locationManager.getCurrentUserLocation()
            let newPin = Pin(id: UUID(), createdAt: .now, latitude: location.latitude, longitude: location.longitude)
            
            self.pinRepository.savePin(newPin)
            self.pins.append(newPin)
        }
        
        func loadPins() {
            self.pins = self.pinRepository.fetchPins()
        }
        
        func deletePin(_ pin: Pin) {
            self.pinRepository.deletePin(pin)
            self.pins.removeAll(where: { $0.id == pin.id })
        }
    }
}
