//
//  RootViewController.swift
//  ToyRootNavigation
//
//  Created by Faiz Mokhtar on 24/12/2017.
//  Copyright © 2017 Faiz Mokhtar. All rights reserved.
//

import UIKit

// Will be the only object responsible for the transition
// between the navigation stacks

class RootViewController: UIViewController {

  private  var current: UIViewController

  init() {
    self.current = SplashViewController()
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    addChildViewController(current)
    current.view.frame = view.bounds
    view.addSubview(current.view)
    current.didMove(toParentViewController: self)
  }

  func showLoginScreen() {
    let loginViewController = LoginViewController()
    let navigationController = UINavigationController(rootViewController: loginViewController)

    addChildViewController(navigationController)
    navigationController.view.frame = view.bounds
    view.addSubview(navigationController.view)
    navigationController.didMove(toParentViewController: self)

    current.willMove(toParentViewController: nil)
    current.view.removeFromSuperview()
    current.removeFromParentViewController()
    current = navigationController
  }

  func showMainScreen() {
    let mainViewController = MainViewController()
    let navigationController = UINavigationController(rootViewController: mainViewController)
    animateFadeTransition(to: navigationController)
  }

  func showLogoutScreen() {
    let loginViewController = LoginViewController()
    let logoutScreen = UINavigationController(rootViewController: loginViewController)
    animateDismissTransition(to: logoutScreen)
  }

  private func animateFadeTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
    current.willMove(toParentViewController: nil)
    addChildViewController(new)

    self.transition(from: current, to: new, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseOut], animations: {

    }) { completed in
      self.current.removeFromParentViewController()
      new.didMove(toParentViewController: self)
      self.current = new
      completion?()
    }
  }

  private func animateDismissTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
    current.willMove(toParentViewController: nil)
    addChildViewController(new)

    self.transition(from: current, to: new, duration: 0.3, options: [], animations: {
      new.view.frame = self.view.bounds
    }) { completed in
      self.current.removeFromParentViewController()
      new.didMove(toParentViewController: self)
      self.current = new
      completion?()
    }
  }
}
