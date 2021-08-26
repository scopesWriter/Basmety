//
//  ColorsManager.swift
//  Banoon
//
//  Created by bishoy on 26/11/2020.
//

import UIKit

enum ColorsManager {
    
    case customBlue
    case customGray
    case background
    case darkGray
    case primaryPurple
    case finalPurple
    case customOrange
    case nbety
    case gold
    case penkishRed
    
    static func pickedColor(color:ColorsManager)->UIColor{
        switch color{
        case .customBlue:
            return UIColor(red:46/255, green: 108/255, blue: 164/255, alpha: 1)
        case .customGray:
            return UIColor(red: 89/255, green: 92/255, blue: 112/255, alpha: 1)
        case .background:
            return UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1)
        case .darkGray:
            return UIColor(red: 110/255, green: 110/255, blue: 110/255, alpha: 1)
        case .primaryPurple:
            return UIColor(red: 147/255, green: 35/255, blue: 115/255, alpha: 1)
        case .finalPurple:
            return UIColor(red: 78/255, green: 10/255, blue: 95/255, alpha: 1)
        case .customOrange:
            return UIColor(red: 243/255, green: 101/255, blue: 35/255, alpha: 1)
        case .nbety:
            return UIColor(red: 215/255, green: 69/255, blue: 70/255, alpha: 1)
        case .gold:
            return UIColor(red: 255/255, green: 203/255, blue: 81/255, alpha: 1)
        case .penkishRed:
            return UIColor.init(red: 193/255, green: 63/255, blue: 85/255, alpha: 1)
        }
    }
}


extension UIButton{
    func setGradient(firstColor:UIColor = UIColor(red: 103/255, green: 94/255, blue: 243/255, alpha: 1),secondColor:UIColor = UIColor(red: 57/255, green: 53/255, blue: 136/255, alpha: 1)) {
        let layer = CAGradientLayer()
        layer.frame = self.bounds
        layer.startPoint = CGPoint(x: 0.5, y: 0)
        layer.endPoint = CGPoint(x: 0.5, y: 1)
        layer.colors = [ secondColor.cgColor,firstColor.cgColor]
        self.layer.addSublayer(layer)
    }
}

