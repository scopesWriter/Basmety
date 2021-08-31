//
//  EditProfileCellVM.swift
//  Basmety
//
//  Created by Mac on 31/08/2021.
//

import Foundation


struct EditProfileCellVM {
    let image: String
    let firstTitle: String
    let secondTitle: String
    
    init(_ model: EditProfileModel) {
        self.image = model.image
        self.firstTitle = model.firstTitle
        self.secondTitle = model.secondTitle
    }
}


struct EditProfileModel {
    let image: String
    let firstTitle: String
    let secondTitle: String
}
