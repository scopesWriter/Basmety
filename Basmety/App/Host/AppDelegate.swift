//
//  AppDelegate.swift
//  Basmety
//
//  Created by Bishoy Badie on 17/08/2021.
//

import UIKit
import IQKeyboardManagerSwift
import XCoordinator

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: Stored properties    
    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    let router = AppCoordinator().strongRouter

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        router.setRoot(for: window!)
        // Localization handling .
        LocalizationManager.shared.setLanguage(language: .English)
        LocalizationManager.shared.setAppInnitLanguage()
        // Enable keyboard handling .
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.placeholderColor = ColorsManager.pickedColor(color: .penkishRed)
        IQKeyboardManager.shared.placeholderButtonColor = ColorsManager.pickedColor(color: .penkishRed)
        
        // White non-translucent navigation bar, supports dark appearance
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = ColorsManager.pickedColor(color: .penkishRed)
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            /// NavigationBar Optimization
            UINavigationBar.appearance().barTintColor = ColorsManager.pickedColor(color: .penkishRed)
            UINavigationBar.appearance().isTranslucent = false
            UINavigationBar.appearance().shadowImage = UIImage()
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        }
        return true
    }
}

extension AppDelegate: LocalizationDelegate {
    func resetApp() {
        guard let window = window else { return }
        window.overrideUserInterfaceStyle = .light
        let vc = ConfigScreenVC.loadFromNib()
        window.rootViewController = vc
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.3
        UIView.transition(with: window, duration: duration, options: options, animations: nil, completion: nil)
    }
}
