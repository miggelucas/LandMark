//
//  HomeCoordinator.swift
//  LandMark
//
//  Created by Lucas Migge on 30/10/24.
//

import UIKit
import SwiftUI

class HomeCoordinator: Coordinator {
    var children: [any Coordinator] = .init()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vm = HomePageView.ViewModel(coordinator: self)
        let view = HomePageView(viewModel: vm)
        let hostingController = UIHostingController(rootView: view)
        
        navigationController.pushViewController(hostingController, animated: false)
    }
    
    func navigateToOtherPage() {
        let vm = OtherPageView.ViewModel(coordinator: self)
        let otherPageView = OtherPageView(viewModel: vm)
        let hostingController = UIHostingController(rootView: otherPageView)
        
        navigationController.pushViewController(hostingController, animated: true)
    }
}
