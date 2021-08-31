//
//  ServicesCellVM.swift
//  Basmety
//
//  Created by Bishoy Badie on 31/08/2021.
//

import Foundation

struct ServicesCellVM {
    let image: String
    let title: String
    let name: String
    let price: Double
    let location: String
    let liked: Bool
    
    init(_ model: ServiceCellModel) {
        self.image = model.image
        self.title = model.title
        self.name = model.name
        self.price = model.price
        self.location = model.location
        self.liked = model.liked
    }
}

struct ServiceCellModel {
    let image: String
    let title: String
    let name: String
    let price: Double
    let location: String
    let liked: Bool
    
}
