//
//  CreatePostCoordinator.swift
//  CoordinatorsDemo
//
//  Created by Prashant Bhargava on 2020-05-14.
//  Copyright © 2020 hootsuite. All rights reserved.
//

import Foundation
import UIKit

protocol CreatePostCoordinatorDelegate: AnyObject {
    func createPostCoordinator(_ coordinator: CreatePostCoordinator, didPost message: Message?)
}

class CreatePostCoordinator: Coordinator, CreatePostViewControllerDelegate {
    weak var delegate: CreatePostCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    private let user: User
    private let navigationController: UINavigationController
    private let storyboard: UIStoryboard

    init(user: User, navigationController: UINavigationController, storyboard: UIStoryboard) {
        self.user = user
        self.navigationController = navigationController
        self.storyboard = storyboard
    }

    func start() {
        let vc = storyboard.instantiateViewController(withIdentifier: "CreatePostViewController") as! CreatePostViewController
        vc.delegate = self
        vc.user = user
        navigationController.pushViewController(vc, animated: true)
    }

    func createPostViewController(_ viewController: CreatePostViewController, didPost message: Message?) {
        delegate?.createPostCoordinator(self, didPost: message)
   }
    
}
