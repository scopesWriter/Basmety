//
//  Helpers.swift
//  Banoon
//
//  Created by bishoy on 26/11/2020.
//

import UIKit
import SDWebImage

extension UITextField {
    
    func adjustTextField(text:String,textColor:UIColor,placeHolderText:String,fontSize:CGFloat,fontType:FontsType){
        self.textColor = textColor
        self.text = text.localized
        self.Aligned()
        self.attributedPlaceholder = NSAttributedString(string: placeHolderText.localized, attributes: [NSAttributedString.Key.foregroundColor:textColor])
        self.fontWithSize(size: fontSize, fontType: fontType)
    }
    
    func stylingTextField(cornerRadius:CGFloat,borderWidth:CGFloat,borderColor:UIColor,clipsToBounds:Bool){
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.clipsToBounds = clipsToBounds
    }
    
}

extension UILabel {
    
    enum alignement{
        case aligned
        case centered
    }
    
    func adjustLabel(text: String, textColor: UIColor, fontSize: CGFloat, fontType: FontsType, alignment: alignement? = .aligned) {
        self.textColor = textColor
        self.text = text.localized
        self.fontWithSize(size: fontSize, fontType: fontType)
        switch alignment {
        case .aligned:
            self.Aligned()
        case .centered:
            self.textAlignment = .center
        case .none:
            self.Aligned()
        }
    }
    
    func stylingLabel(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor, clipsToBounds: Bool) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.clipsToBounds = clipsToBounds
    }
    
}

extension UIButton {
    
    func adjustButton(text:String,textColor:UIColor,fontSize:CGFloat,fontType:FontsType){
        self.setTitleColor(textColor, for: .normal)
        self.setTitle(text.localized, for: .normal)
        self.titleLabel?.Aligned()
        self.titleLabel?.fontWithSize(size: fontSize, fontType: fontType)
    }
    
    func stylingButton(cornerRadius:CGFloat,borderWidth:CGFloat,borderColor:UIColor,clipsToBounds:Bool,backgroundColor:UIColor? = .clear){
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.clipsToBounds = clipsToBounds
        self.backgroundColor = backgroundColor
    }
    
}

extension UITextView {
    
    func adjustTextView(text:String,textColor:UIColor,fontSize:CGFloat,fontType:FontsType){
        self.textColor = textColor
        self.text = text.localized
        self.Aligned()
        self.fontWithSize(size: fontSize, fontType: fontType)
    }
    
    func stylingTextView(cornerRadius:CGFloat,borderWidth:CGFloat,borderColor:UIColor,clipsToBounds:Bool){
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.clipsToBounds = clipsToBounds
    }
    
}


extension UIViewController{
    
    //Used to initialize view Controller and return it' class
    func create(storyboardName: String,viewController:String,presentationStyle:UIModalPresentationStyle) -> UIViewController{
        let vc = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: viewController)
        vc.modalPresentationStyle = presentationStyle
        return vc
    }
    
    // setting the root view Controller
    func setRootViewController(with storyboardName:String,with name : String){
        let vc = create(storyboardName: storyboardName, viewController: name, presentationStyle: .fullScreen)
        let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDel.window?.rootViewController = vc
    }
    
    //creating an alert and  optimize it's data
    func alert(message: String, title: String = "Alert".localized) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func adjustView(cornerRadius:CGFloat,borderWidth:CGFloat,borderColor:UIColor,clipsToBounds:Bool,backGroundColor:UIColor){
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.clipsToBounds = clipsToBounds
        self.backgroundColor = backGroundColor
    }
}

extension UIImageView {
    
    func loadImage(With link: String) {
        if let url = URL(string: link) {
            self.sd_setImage(with: url, placeholderImage: UIImage(named: "placeHolderImage"), options: .continueInBackground, context: [:])
        }
    }
    
}

extension Encodable {
    
    var dictionaryFromObject: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}

extension String {
    
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
    
}

extension Date {
    
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
    
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}

extension String{
    
    func toDate()->Date?{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return formatter.date(from: self) ?? Date()
    }
    
    func changeDate(_ mydate:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let convertedDate = dateFormatter.date(from: mydate)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.string(from: convertedDate!)
        return date
    }
    
}

extension Date{
    
    func toString()->String?{
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: currentDate)
    }
    
}

extension UIApplication {
//    
//    class func topViewController(viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
//        if let nav = viewController as? UINavigationController {
//            return topViewController(viewController: nav.visibleViewController)
//        }
//        if let tab = viewController as? UITabBarController {
//            if let selected = tab.selectedViewController {
//                return topViewController(viewController: selected)
//            }
//        }
//        if let presented = viewController?.presentedViewController {
//            return topViewController(viewController: presented)
//        }
//        return viewController
//    }
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .lightContent
    }
}

extension UIStackView {
    func removeAllArrangedSubviews() {
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        
        // Deactivate all constraints
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        
        // Remove the views from self
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}

extension String {
    
    func stripOutHtml() -> String? {
        do {
            guard let data = self.data(using: .unicode) else {
                return nil
            }
            let attributed = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            return attributed.string
        } catch {
            return nil
        }
    }
}
