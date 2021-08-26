//
//  LoginManager.swift
//  Banoon
//
//  Created by bishoy on 26/11/2020.
//

import Foundation

public enum loginManager:LocalizedError{
    case usernameIsEmpty,passwordIsEmpty,mobileIsEmpty,emailIsEmpty,postalIsEmpty,addressIsEmpty,countryIsEmpty,cityIsEmpty,EmailNotValid,paswordIsMisMatched,messageIsEmpty,distributorNameIsEmpty,jobTitleIsEmpty,directManagerNameIsEmpty
    
    var localizedDescription: String{
        switch self {
        case .usernameIsEmpty:return "usernameIsEmpty".localized
        case .passwordIsEmpty:return "passwordIsEmpty".localized
        case .mobileIsEmpty:return "mobileIsEmpty".localized
        case .EmailNotValid:return "EmailNotValid".localized
        case .emailIsEmpty:return "emailIsEmpty".localized
        case .postalIsEmpty:return "postalIsEmpty".localized
        case .addressIsEmpty:return "addressIsEmpty".localized
        case .cityIsEmpty:return "cityIsEmpty".localized
        case .countryIsEmpty:return "countryIsEmpty".localized
        case .paswordIsMisMatched:return "paswordIsMisMatched".localized
        case .messageIsEmpty:return "messageIsEmpty".localized
        case .distributorNameIsEmpty:return "distributorNameIsEmpty".localized
        case .jobTitleIsEmpty: return "jobTitleIsEmpty".localized
        case .directManagerNameIsEmpty: return "DirectManagerIsEmpty".localized
        }
    }
}

extension String{
    
    var trimmed:String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
}
