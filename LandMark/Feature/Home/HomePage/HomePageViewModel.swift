//
//  HomePageViewModel.swift
//  LandMark
//
//  Created by Lucas Migge on 30/10/24.
//

import SwiftUI

extension HomePageView {
    class ViewModel: ObservableObject {
        
        let coordinator: HomeCoordinator
        
        init(coordinator: HomeCoordinator = HomeCoordinator(navigationController: .init())) {
            self.coordinator = coordinator
        }
        
        func didTapOnTryMeButton() {
            coordinator.navigateToOtherPage()
        }
        
        func didTapOnPinButton() {
            coordinator.navigateToPinListPage()
        }
    }
}
