//
//  OnboardingViewController.swift
//  CoordinatorsDemo
//
//  Created by Prashant Bhargava on 2020-05-14.
//  Copyright © 2020 hootsuite. All rights reserved.
//

import UIKit

protocol OnboardingViewControllerDelegate: AnyObject {
    func onboardingViewControllerDidPressNext(_ viewController: OnboardingViewController)
}

class OnboardingViewController: UIViewController {
    weak var delegate: OnboardingViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func nextAction(_ sender: Any) {
        delegate?.onboardingViewControllerDidPressNext(self)
    }
}
