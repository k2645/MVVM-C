//
//  LoginCoordinator.swift
//  MVVM-C
//
//  Created by 김영현 on 10/12/24.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func loggedIn(_ coordinator: LoginCoordinator)
}

final class LoginCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var delegate: LoginCoordinatorDelegate? {
        didSet {
            if delegate == nil {
                print("LoginCoordinatorDelegate became nil")
            }
        }
    }
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        print("- \(type(of:self)) init")
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    func start() {
        let viewController = LoginViewController()
        viewController.view.backgroundColor = .brown
        viewController.delegate = self
        
        navigationController.viewControllers = [viewController]
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func loginButtonDidTapped() {
        delegate?.loggedIn(self)
    }
}
