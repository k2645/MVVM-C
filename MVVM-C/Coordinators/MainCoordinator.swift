//
//  MainCoordinator.swift
//  MVVM-C
//
//  Created by 김영현 on 10/12/24.
//

import UIKit

protocol MainCoordinatorDelegate: AnyObject {
    func loggedOut(_ coordinator: MainCoordinator)
}

final class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var delegate: MainCoordinatorDelegate? {
        didSet {
            if delegate == nil {
                print("MainCoordinatorDelegate became nil")
            }
        }
    }
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        print("- \(type(of: self)) init")
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    func start() {
        let viewController = MainViewController()
        viewController.view.backgroundColor = .orange
        viewController.delegate = self
        
        navigationController.viewControllers = [viewController]
    }
}

extension MainCoordinator: MainViewControllerDelegate {
    func logoutButtonDidTapped() {
        delegate?.loggedOut(self)
    }
}
