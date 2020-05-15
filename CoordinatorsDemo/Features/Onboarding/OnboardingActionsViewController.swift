//
//  OnboardingActionsViewController.swift
//  CoordinatorsDemo
//
//  Created by Prashant Bhargava on 2020-05-14.
//  Copyright © 2020 hootsuite. All rights reserved.
//

import UIKit

protocol OnboardingActionsViewControllerDelegate: AnyObject {
    func onboardingActionsViewControllerDidPressLogin(_ viewController: OnboardingActionsViewController)
    func onboardingActionsViewControllerDidPressSignup(_ viewController: OnboardingActionsViewController)
    func onboardingActionsViewControllerDidPressCreatePost(_ viewController: OnboardingActionsViewController)
}

class OnboardingActionsViewController: UIViewController {
    weak var delegate: OnboardingActionsViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        delegate?.onboardingActionsViewControllerDidPressLogin(self)
    }

    @IBAction func signupAction(_ sender: Any) {
        delegate?.onboardingActionsViewControllerDidPressSignup(self)
    }

    @IBAction func createPostAction(_ sender: Any) {
        delegate?.onboardingActionsViewControllerDidPressCreatePost(self)
    }
}
