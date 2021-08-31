//
//  ProfileCellVM.swift
//  Basmety
//
//  Created by Mac on 30/08/2021.
//

import Foundation

struct ProfileCellVM {
    let image: String
    let title: String
    
    init(_ model: ProfileCellModel) {
        self.title = model.title
        self.image = model.image
    }
}

struct ProfileCellModel {
    let image: String
    let title: String
}
