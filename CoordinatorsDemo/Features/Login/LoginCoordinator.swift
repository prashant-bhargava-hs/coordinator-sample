//
//  LoginCoordinator.swift
//  CoordinatorsDemo
//
//  Created by Prashant Bhargava on 2020-05-15.
//  Copyright © 2020 hootsuite. All rights reserved.
//

import Foundation
import UIKit


class LoginCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private let unsavedMessages: [Message]
    private let storyboard: UIStoryboard

    init(unsavedMessages: [Message], navigationController: UINavigationController, storyboard: UIStoryboard) {
        self.navigationController = navigationController
        self.unsavedMessages = unsavedMessages
        self.storyboard = storyboard
    }

    func start() {
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        vc.messageCount = unsavedMessages.count
        navigationController.pushViewController(vc, animated: true)
    }
}
