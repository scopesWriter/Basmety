//
//  AlignmentManager.swift
//  Banoon
//
//  Created by bishoy on 26/11/2020.
//


import UIKit

extension UILabel {
    func Aligned() {
        if LocalizationManager.shared.getLanguage() == .Arabic {
            self.textAlignment = .right
        } else {
            self.textAlignment = .left
        }
    }
    
    func center(){
        self.textAlignment = .center
    }
}


extension UITextView{
    func Aligned(){
        if LocalizationManager.shared.getLanguage() == .Arabic{
            self.textAlignment = .right
        }else{
            self.textAlignment = .left
        }
    }
    
    func center(){
        self.textAlignment = .center
    }
}


extension UITextField{
    func Aligned(){
        if LocalizationManager.shared.getLanguage() == .Arabic {
            self.textAlignment = .right
        }else{
            self.textAlignment = .left
        }
    }
    
       func center(){
           self.textAlignment = .center
       }
}

