//
//  AppCoordinator.swift
//  MVVM-C
//
//  Created by 김영현 on 10/12/24.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var childCoordinators: [any Coordinator] = []
    private var navigationController: UINavigationController
    
    var isLoggIn: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if isLoggIn {
            showMainViewController()
        } else {
            showLoginViewController()
        }
    }
    
    private func showLoginViewController() {
        let coordinator = LoginCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start()
        /// 새로 추가될 coordinator를 childCoordinator에 추가 ~
        childCoordinators.append(coordinator)
    }
    
    private func showMainViewController() {
        let coordinator = MainCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func loggedIn(_ coordinator: LoginCoordinator) {
        /// 사라질 coordinator이니까 childCoordinator에서 걸러주기 ~
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
        showMainViewController()
    }
}

extension AppCoordinator: MainCoordinatorDelegate {
    func loggedOut(_ coordinator: MainCoordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
        showLoginViewController()
    }
}
