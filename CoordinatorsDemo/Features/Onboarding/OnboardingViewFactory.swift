//
//  OnboardingViewFactory.swift
//  CoordinatorsDemo
//
//  Created by Prashant Bhargava on 2020-05-14.
//  Copyright © 2020 hootsuite. All rights reserved.
//

import Foundation
import UIKit

struct OnboardingViewFactory {

    enum OnboardingViewIdentifiers: String {
        case OnboardingViewController
        case OnboardingActionsViewController
    }

    private let storyboard: UIStoryboard
    init(storyboard: UIStoryboard) {
        self.storyboard = storyboard
    }

    func getOnboardingViewController(delegate: OnboardingViewControllerDelegate? = nil) -> OnboardingViewController {
        let vc = storyboard.instantiateViewController(identifier: OnboardingViewIdentifiers.OnboardingViewController.rawValue) as! OnboardingViewController
        vc.delegate = delegate
        return vc
    }

    func getOnboardingActionsViewController(delegate: OnboardingActionsViewControllerDelegate? = nil) -> OnboardingActionsViewController {
        let vc = storyboard.instantiateViewController(identifier: OnboardingViewIdentifiers.OnboardingActionsViewController.rawValue) as! OnboardingActionsViewController
        vc.delegate = delegate
        return vc
    }
}
