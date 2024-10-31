//
//  OtherPageViewModel.swift
//  LandMark
//
//  Created by Lucas Migge on 30/10/24.
//

import SwiftUI

extension OtherPageView {
    class ViewModel: ObservableObject {
        
        let coordinator: HomeCoordinator
        
        init(coordinator: HomeCoordinator = .init(navigationController: .init())) {
            self.coordinator = coordinator
        }
        
    }
}
