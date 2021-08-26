//
//  FontHandler.swift
//  Banoon
//
//  Created by bishoy on 26/11/2020.
//


import UIKit

extension UILabel {
    
    func fontWithSize(size: CGFloat, fontType: FontsType) {
        var desiredFont: String = ""
        if LocalizationManager.shared.getLanguage() == .Arabic {
            desiredFont = fontType.FontTypeAr
        } else {
            desiredFont = fontType.typeFontEn
        }
        guard let font = UIFont(name: desiredFont, size:size) else { return }
        self.font = font
    }
    
}

extension UITextField {
    
    func fontWithSize(size: CGFloat, fontType: FontsType) {
        var desiredFont: String = ""
        if LocalizationManager.shared.getLanguage() == .Arabic {
            desiredFont = fontType.FontTypeAr
        } else {
            desiredFont = fontType.typeFontEn
        }
        guard let font = UIFont(name: desiredFont, size:size) else { return }
        self.font = font
    }
    
}

extension UITextView {
    
    func fontWithSize(size: CGFloat, fontType: FontsType) {
        var desiredFont: String = ""
        if LocalizationManager.shared.getLanguage() == .Arabic {
            desiredFont = fontType.FontTypeAr
        } else {
            desiredFont = fontType.typeFontEn
        }
        
        guard let font = UIFont(name: desiredFont, size: size) else { return }
        self.font = font
    }
    
}

enum FontsType {
    
    case regular, regulartItalic, thin, thinItalic, bold, light, medium, extraLight, extraLightItalic, lightItalic, mediumItalic, semibold, semiBoldItalic, boldItalic, extraBold, black, blackItalic
    
    //MARK: Arabic Fonts
    var FontTypeAr: String {
        switch self {
        //MARK: Arabic Fonts
        case .regular: return "Somar-Regular"
        case .regulartItalic: return "Somar-RegularItalic"
        case .thin: return "Somar-Thin"
        case .thinItalic: return "Somar-ThinItalic"
        case .bold:return "Somar-Bold"
        case .boldItalic: return "Somar-BoldItalic"
        case .medium: return "Somar-Medium"
        case .mediumItalic: return "Somar-MediumItalic"
        case .light: return "Somar-Light"
        case .lightItalic: return "Somar-LightItalic"
        case .extraLight: return "Somar-ExtraLight"
        case .extraLightItalic: return "Somar-ExtraLightItalic"
        case .semibold: return "Somar-SemiBold"
        case .semiBoldItalic: return "Somar-BoldItalic"
        case .extraBold: return "Somar-ExtraBold"
        case .black: return "Somar-Black"
        case .blackItalic: return "Somar-BlackItalic"
        }
    }
    
    //MARK: English Fonts
    var typeFontEn: String {
        
        switch self {
        case .regular: return "Poppins-Regular"
        case .regulartItalic: return "Poppins-RegularItalic"
        case .thin: return "Poppins-Thin"
        case .thinItalic: return "Poppins-ThinItalic"
        case .bold: return "Poppins-Bold"
        case .light: return "Poppins-Light"
        case .medium: return "Poppins-Medium"
        case .extraLight: return "Poppins-Light"
        case .extraLightItalic: return "Poppins-ExtraLightItalic"
        case .lightItalic: return "Poppins-LightItalic"
        case .mediumItalic: return "Poppins-MediumItalic"
        case .semibold: return "Poppins-SemiBold"
        case .semiBoldItalic: return "Poppins-SemiBoldItalic"
        case .boldItalic: return "Poppins-BoldItalic"
        case .extraBold: return "Poppins-ExtraBold"
        case .black: return "Poppins-Black"
        case .blackItalic: return "Poppins-BlackItalic"
        }
    }
    
}

//["Somar-Regular", "Somar-RegularItalic", "Somar-Thin", "Somar-ThinItalic", "Somar-ExtraLight", "Somar-ExtraLightItalic", "Somar-Light", "Somar-LightItalic", "Somar-Medium", "Somar-MediumItalic", "Somar-SemiBold", "Somar-SemiBoldItalic", "Somar-Bold", "Somar-BoldItalic", "Somar-ExtraBold", "Somar-Black", "Somar-BlackItalic"]

//["Poppins-Regular", "Poppins-Thin", "Poppins-ThinItalic", "Poppins-ExtraLight", "Poppins-ExtraLightItalic", "Poppins-Light", "Poppins-LightItalic", "Poppins-Medium", "Poppins-MediumItalic", "Poppins-SemiBold", "Poppins-SemiBoldItalic", "Poppins-Bold", "Poppins-BoldItalic", "Poppins-ExtraBold", "Poppins-ExtraBoldItalic", "Poppins-Black", "Poppins-BlackItalic"]
