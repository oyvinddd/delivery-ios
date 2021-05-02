//
//  AppDelegate.swift
//  Delivery
//
//  Created by Øyvind Hauge on 20/01/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = initialViewController()
        window?.makeKeyAndVisible()
        return true
    }
    
    private func initialViewController() -> UIViewController {
        let viewController = RestaurantsViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = true
        return navigationController
    }
}
