//
//  LoginViewController.swift
//  MVVM-C
//
//  Created by 김영현 on 10/12/24.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func loginButtonDidTapped()
}

final class LoginViewController: UIViewController {
    
    private let loginButton: UIButton = {
        var configure = UIButton.Configuration.filled()
        configure.title = "Login"
        let button = UIButton()
        button.configuration = configure
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    weak var delegate: LoginViewControllerDelegate?
    
    init() {
        print("- \(type(of:self)) init")
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        loginButton.addAction(loginButtonTapped() , for: .touchUpInside)
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    private func setUpUI() {
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func loginButtonTapped() -> UIAction {
        UIAction { [weak self] _ in
            guard let self else { return }
            self.delegate?.loginButtonDidTapped()
        }
    }
}
