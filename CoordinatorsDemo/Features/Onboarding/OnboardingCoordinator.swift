//
//  OnboardingCoordinator.swift
//  CoordinatorsDemo
//
//  Created by Prashant Bhargava on 2020-05-14.
//  Copyright © 2020 hootsuite. All rights reserved.
//

import Foundation
import UIKit

enum OnboardingCoordinatorResults {
    case login, signup, createPost
}

protocol OnboardingCoordinatorDelegate: AnyObject {
    func onboardingCoodinator(_ coordinator: OnboardingCoordinator, result: OnboardingCoordinatorResults)
}

class OnboardingCoordinator: Coordinator, OnboardingViewControllerDelegate, OnboardingActionsViewControllerDelegate {

    weak var delegate: OnboardingCoordinatorDelegate?

    var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private let onboardingViewFactory: OnboardingViewFactory

    init(navigationController: UINavigationController, onboardingViewFactory: OnboardingViewFactory) {
        self.navigationController = navigationController
        self.onboardingViewFactory = onboardingViewFactory
    }

    func start() {
        navigationController.pushViewController(onboardingViewFactory.getOnboardingViewController(delegate: self), animated: true)
    }


    // Screen 1 Delegate
    func onboardingViewControllerDidPressNext(_ viewController: OnboardingViewController) {
        navigationController.pushViewController(onboardingViewFactory.getOnboardingActionsViewController(delegate: self), animated: true)
    }

    // Screen 2 Delegate
    func onboardingActionsViewControllerDidPressLogin(_ viewController: OnboardingActionsViewController) {
        delegate?.onboardingCoodinator(self, result: .login)
    }

    func onboardingActionsViewControllerDidPressSignup(_ viewController: OnboardingActionsViewController) {
        delegate?.onboardingCoodinator(self, result: .signup)
    }

    func onboardingActionsViewControllerDidPressCreatePost(_ viewController: OnboardingActionsViewController) {
        delegate?.onboardingCoodinator(self, result: .createPost)
    }


}
