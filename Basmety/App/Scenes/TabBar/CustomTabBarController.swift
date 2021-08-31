//
//  CustomTabBarController.swift
//  Basmety
//
//  Created by Mac on 29/08/2021.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = ColorsManager.pickedColor(color: .penkishRed)
    }
    

}
