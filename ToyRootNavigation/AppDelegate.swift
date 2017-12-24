//
//  AppDelegate.swift
//  ToyRootNavigation
//
//  Created by Faiz Mokhtar on 24/12/2017.
//  Copyright © 2017 Faiz Mokhtar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = RootViewController()
    window?.makeKeyAndVisible()

    return true
  }
}

extension AppDelegate {
  static var shared: AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
  }

  var rootViewController: RootViewController {
    return window!.rootViewController as! RootViewController
  }
}
