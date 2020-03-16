//
//  AppDelegate.swift
//  Practical
//
//  Created by AR on 16/03/20.
//  Copyright © 2020 DNK028. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navigationController: UINavigationController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        let practicalVCVC = PracticalVCViewController.init(nibName: "PracticalVCViewController", bundle: nil)
        navigationController = UINavigationController.init(rootViewController: practicalVCVC)
        window?.rootViewController = navigationController
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//    
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
//    
    
    //MARK: NAVIGATION METHODS
    fileprivate func navigateToViewController(_ viewController: UIViewController) {
        var arrViewController = [UIViewController]()
        arrViewController = self.navigationController.viewControllers
        
        if !arrViewController.isEmpty && arrViewController.last! != viewController {
            //        if !arrViewController.isEmpty && arrViewController.last == viewController {
            if self.isViewControllerExist(viewController) {
                let viewControllerIndex: Int = self.getViewControllerIndex(viewController)
                self.navigationController.popToViewController(arrViewController[viewControllerIndex], animated: true)
            }
            else { self.navigationController.pushViewController(viewController, animated: true) }
        }
    }
    
    fileprivate func isViewControllerExist(_ viewController: UIViewController) -> Bool {
        var arrViewController = [UIViewController]()
        arrViewController = self.navigationController.viewControllers
        for vc in arrViewController {
            if NSStringFromClass(vc.classForCoder) == NSStringFromClass(viewController.classForCoder) {
                return true
            }
        }
        return false
    }
    
    fileprivate func getViewControllerIndex(_ viewController: UIViewController) -> Int {
        let arrViewController: Array<UIViewController> = self.navigationController.viewControllers
        for vc in arrViewController {
            if NSStringFromClass(vc.classForCoder) == NSStringFromClass(viewController.classForCoder) {
                return Int(arrViewController.index(of: vc)!)
            }
        }
        return 0;
    }
    
}

