//
//  SceneDelegate.swift
//  FinalProject
//
//  Created by Thinh Nguyen X. on 9/10/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import GoogleSignIn
import Firebase
import UIKit
import SwiftUI
import SVProgressHUD

//typealias HUD = SVProgressHUD

class SceneDelegate: UIResponder, UIWindowSceneDelegate, GIDSignInDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let vc = HomeViewController()
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let homeNavi = UINavigationController(rootViewController: vc)
            window.rootViewController = homeNavi
            self.window = window
            window.makeKeyAndVisible()
            
            FirebaseApp.configure()
            
            GIDSignIn.sharedInstance()?.clientID = GoogleSignIn.clientID
            GIDSignIn.sharedInstance()?.delegate = self
        }
    }
    
    static let shared: SceneDelegate = {
        guard let shared = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            fatalError("Cannot case 'SceneDelegate'")
        }
        return shared
    }()
    
    func changeRoot(type: App.TypeScreen) {
        switch type {
        case .login:
            createLogin()
        case .home:
            createHome()
        }
    }
    
    private func createLogin() {
        let vc = LoginViewController()
        let loginNavi = UINavigationController(rootViewController: vc)
        window?.rootViewController = loginNavi
    }
    
    private func createHome() {
        let vc = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: vc)
        window?.rootViewController = homeNavi
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        let vc = UIViewController()
        if error == nil {
            changeRoot(type: .home)
        } else {
            vc.showAlert(title: "Not Response", message: App.ErorSignIn.notResponse)
        }
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
