//
//  BarButtonManager.swift
//  Banoon
//
//  Created by bishoy on 26/11/2020.
//


import UIKit

extension UIBarButtonItem{
func createBarButtonItem(_ target: AnyObject, action: Selector, imageName:String, BadgeCount: Int) -> UIBarButtonItem {
    
    let rightBtn = UIButton(type: UIButton.ButtonType.custom)
    rightBtn.backgroundColor = UIColor.clear
    rightBtn.frame = CGRect(x: 0, y: 0, width: 26, height: 26)
    rightBtn.setImage(UIImage(systemName: imageName), for: UIControl.State())
    rightBtn.tintColor = .white
    rightBtn.imageView?.tintColor = .white
    rightBtn.addTarget(target, action: action, for: UIControl.Event.touchUpInside)
    
    let negativeSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace, target: nil, action: nil)
    negativeSpace.width = -5
    
    // badge label
    if  BadgeCount > 0 {
        let label = UILabel(frame: CGRect(x: 10, y: -7, width: 18, height: 18))
        label.layer.borderColor = ColorsManager.pickedColor(color: .penkishRed).cgColor
        label.layer.borderWidth = 2
        label.layer.cornerRadius = label.bounds.size.height / 2
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.textColor = ColorsManager.pickedColor(color: .penkishRed)
        label.backgroundColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.text = "\(BadgeCount)"
        rightBtn.addSubview(label)
    }
    
    let barButton = UIBarButtonItem(customView:rightBtn)
    return barButton
}
}

