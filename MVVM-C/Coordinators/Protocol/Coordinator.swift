//
//  Coordinator.swift
//  MVVM-C
//
//  Created by 김영현 on 10/12/24.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}
