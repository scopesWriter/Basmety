//
//  WizardCellVM.swift
//  Basmety
//
//  Created by OSX on 19/08/2021.
//

import Foundation

struct WizardCellVM {
    let image: String
    let title: String
    let desc: String
    
    
    init(_ model: WizardModel) {
        self.image = model.image
        self.title = model.title
        self.desc = model.desc
    }
}

struct WizardModel {
    let image: String
    let title: String
    let desc: String
}
