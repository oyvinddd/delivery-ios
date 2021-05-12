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
        // set initial view controller
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = initialViewController()
        window?.makeKeyAndVisible()
        // Remove 1px top border on tab bar
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = .white
        return true
    }
    
    private func initialViewController() -> UIViewController {
        
        let restaurantsViewController = RestaurantsViewController()
        let mapViewController = MapViewController()
        let myOrdersViewController = MyOrdersViewController()
        let settingsViewController = SettingsViewController()
        
        let restaurantsNavigationController = UINavigationController(rootViewController: restaurantsViewController)
        restaurantsNavigationController.isNavigationBarHidden = true
        
        let mapNavigationController = UINavigationController(rootViewController: mapViewController)
        
        let myOrdersNavigationController = UINavigationController(rootViewController: myOrdersViewController)
        
        let settingsNavigationController = UINavigationController(rootViewController: settingsViewController)
        
        let viewControllers: [UIViewController] = [
            restaurantsNavigationController,
            mapNavigationController,
            myOrdersNavigationController,
            settingsNavigationController
        ]
        let mainTabBarController = createTabBarController()
        mainTabBarController.setViewControllers(viewControllers, animated: false)
        return mainTabBarController
    }
    
    private func createTabBarController() -> UITabBarController {
        let tabBarController = MainTabBarController()
        tabBarController.tabBar.isTranslucent = false
        return tabBarController
    }
}
