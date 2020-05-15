//
//  AppSetup.swift
//  CoordinatorsDemo
//
//  Created by Prashant Bhargava on 2020-05-14.
//  Copyright © 2020 hootsuite. All rights reserved.
//

import Foundation
import UIKit

class AppSetup {
    let window: UIWindow
    let appCoordinator: AppCoordinator

    init(windowScene: UIWindowScene) {
        // Setup the app
        self.window = UIWindow(windowScene: windowScene)
        let rootViewController = UINavigationController()
        // Create Root Coordinator
        self.appCoordinator = AppCoordinator(
            navigationController: rootViewController,
            onboardingCoordinator: { rootViewController  in
            return OnboardingCoordinator(
                navigationController: rootViewController,
                onboardingViewFactory: OnboardingViewFactory(
                    storyboard: UIStoryboard(name: "Onboarding",
                                             bundle: nil)
            ))
        }, createPostCoordinator: { navigationController, user in
            return CreatePostCoordinator(
                user: user,
                navigationController: navigationController,
                storyboard: UIStoryboard(name: "CreatePost",
                                         bundle: nil))
        }, loginCoordinator: { navigationController, message in
            return LoginCoordinator(
                unsavedMessages: message,
                navigationController: navigationController,
                storyboard: UIStoryboard(name: "Login",
                                         bundle: nil))

        }, user: User(name: "Anonymous"))

        
        appCoordinator.start()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
