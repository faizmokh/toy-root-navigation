//
//  LoginViewController.swift
//  ToyRootNavigation
//
//  Created by Faiz Mokhtar on 24/12/2017.
//  Copyright © 2017 Faiz Mokhtar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    title = "Login screen"

    let loginButton = UIBarButtonItem(title: "Log in", style: .plain, target: self, action: #selector(login))
    navigationItem.setLeftBarButton(loginButton, animated: true)
  }

  @objc private func login() {
    UserDefaults.standard.set(true, forKey: "LOGGED_IN")
    AppDelegate.shared.rootViewController.showMainScreen()
  }
}
