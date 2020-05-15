//
//  AppCoordinator.swift
//  CoordinatorsDemo
//
//  Created by Prashant Bhargava on 2020-05-14.
//  Copyright © 2020 hootsuite. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set}
    func start()
}

extension Coordinator {
    func startChildCoordinator(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.start()
    }

    func endChildCoordinator(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}

// Root level Coordinator
class AppCoordinator: Coordinator, OnboardingCoordinatorDelegate, CreatePostCoordinatorDelegate {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    let onboardingCoordinator: (UINavigationController) -> OnboardingCoordinator
    let createPostCoordinator: (UINavigationController, User) -> CreatePostCoordinator
    let loginCoordinator: (UINavigationController, [Message]) -> LoginCoordinator
    var message: [Message] = []
    let user: User

    init(navigationController: UINavigationController,
         onboardingCoordinator: @escaping (UINavigationController) -> OnboardingCoordinator,
         createPostCoordinator: @escaping (UINavigationController, User) -> CreatePostCoordinator,
         loginCoordinator: @escaping (UINavigationController, [Message]) -> LoginCoordinator,
         user: User) {
        self.navigationController = navigationController
        self.onboardingCoordinator = onboardingCoordinator
        self.createPostCoordinator = createPostCoordinator
        self.loginCoordinator = loginCoordinator
        self.user = user
    }

    func start() {
        let onboardingCoordinator = self.onboardingCoordinator(navigationController)
        onboardingCoordinator.delegate = self
        startChildCoordinator(coordinator: onboardingCoordinator)
    }


    // Onboarding Delegate
    func onboardingCoodinator(_ coordinator: OnboardingCoordinator, result: OnboardingCoordinatorResults) {
        switch result {
        case .createPost:
            let createPostCoordinator = self.createPostCoordinator(navigationController, user)
            createPostCoordinator.delegate = self
            startChildCoordinator(coordinator: createPostCoordinator)
        case .login:
            let loginCoordinator = self.loginCoordinator(navigationController, message)
            startChildCoordinator(coordinator: loginCoordinator)
        default:
            #warning("TODO: Implement rest of the cases")
            break
        }
    }

    // Create Post Delegate
    func createPostCoordinator(_ coordinator: CreatePostCoordinator, didPost message: Message?) {
        self.navigationController.popViewController(animated: true)
        endChildCoordinator(coordinator: coordinator)
        guard let message = message else {
            return
        }
        self.message.append(message)
    }



}
