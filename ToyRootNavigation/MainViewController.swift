//
//  MainViewController.swift
//  ToyRootNavigation
//
//  Created by Faiz Mokhtar on 24/12/2017.
//  Copyright © 2017 Faiz Mokhtar. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor.lightGray
    title = "Main screen"
    let logoutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logout))
    navigationItem.setLeftBarButton(logoutButton, animated: true)
  }

  @objc private func logout() {
    UserDefaults.standard.set(false, forKey: "LOGGED_IN")
    AppDelegate.shared.rootViewController.showLogoutScreen()
  }
}
