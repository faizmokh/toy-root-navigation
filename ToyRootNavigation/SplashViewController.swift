//
//  SplashViewController.swift
//  ToyRootNavigation
//
//  Created by Faiz Mokhtar on 24/12/2017.
//  Copyright © 2017 Faiz Mokhtar. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

  private let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor.green
    view.addSubview(activityIndicator)
    activityIndicator.frame = view.bounds
    activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.4)
    makeServiceCall()
  }

  private func makeServiceCall() {
    print("Making service call...")
    activityIndicator.startAnimating()
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
      self.activityIndicator.stopAnimating()
      print("Service call finished!")

      if UserDefaults.standard.bool(forKey: "LOGGED_IN") {
        // navigate to protected page
        AppDelegate.shared.rootViewController.showMainScreen()
      } else {
        // navigate to login screen
        AppDelegate.shared.rootViewController.showLogoutScreen()
      }
    }
  }
}
