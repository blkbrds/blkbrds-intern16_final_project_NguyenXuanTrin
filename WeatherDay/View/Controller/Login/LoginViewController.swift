//
//  LoginViewController.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/23/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import GoogleSignIn
import UIKit

class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var signInButton: GIDSignInButton!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configLoginWithGoogle()
    }

    // MARK: - Private Functions
    private func configLoginWithGoogle() {
        signInButton.style = .wide
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
}
