//
//  AppCoordinator.swift
//  LandMark
//
//  Created by Lucas Migge on 30/10/24.
//

import UIKit

protocol Coordinator {
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}

class AppCoordinator: Coordinator {
    var children: [Coordinator] = .init()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainCoordinator = HomeCoordinator(navigationController: navigationController)
        mainCoordinator.start()
    }
}
