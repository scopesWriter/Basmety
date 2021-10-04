//
//  NotificationCellVM.swift
//  Basmety
//
//  Created by Mac on 01/09/2021.
//

import Foundation

struct NotificationCellVM {
    
    let image: String
    let firstTitle: String
    let secondTitle: String
    let thirdTitle: String
    let date: String
    
    
    init(_ model: NotificationCellModel) {
        self.image = model.image
        self.firstTitle = model.firstTitle
        self.secondTitle = model.secondTitle
        self.thirdTitle = model.thirdTitle
        self.date = model.date
    }
    
}

struct NotificationCellModel {
    let image: String
    let firstTitle: String
    let secondTitle: String
    let thirdTitle: String
    let date: String
}
