//
//  MainViewController.swift
//  MVVM-C
//
//  Created by 김영현 on 10/12/24.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func logoutButtonDidTapped()
}

final class MainViewController: UIViewController {
    
    private let logoutButton: UIButton = {
        var configure = UIButton.Configuration.filled()
        configure.title = "Logout"
        let button = UIButton()
        button.configuration = configure
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    weak var delegate: MainViewControllerDelegate?
    
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
        logoutButton.addAction(logoutButtonTapped(), for: .touchUpInside)
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    private func setUpUI() {
        view.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func logoutButtonTapped() -> UIAction {
        UIAction { [weak self] _ in
            guard let self else { return }
            self.delegate?.logoutButtonDidTapped()
        }
    }
}
