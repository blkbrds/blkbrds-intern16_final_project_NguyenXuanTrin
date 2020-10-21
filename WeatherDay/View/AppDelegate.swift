//
//  AppDelegate.swift
//  FinalProject
//
//  Created by Thinh Nguyen X. on 9/10/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit
import SVProgressHUD

typealias HUD = SVProgressHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static let shared: AppDelegate = {
        guard let share = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Can not get appdelegate")
        }
        return share
    }()
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configHUD()
        return true
    }
    
    private func configHUD() {
        HUD.setDefaultMaskType(.clear)
    }
}
