//
//  MostPopularCellVM.swift
//  Basmety
//
//  Created by Mac on 30/08/2021.
//

import Foundation

struct MostPopularCellVM {
    let image: String
    let liked: Bool
    let backgroundImage: String
    let name: String
    let location: String
    let rate: Double
    
    init(_ model: MostPopularCellModel) {
        self.image = model.image
        self.liked = model.liked
        self.backgroundImage = model.backgroundImage
        self.name = model.name
        self.location = model.location
        self.rate = model.rate
    }
}


struct MostPopularCellModel {
    let image: String
    let liked: Bool
    let backgroundImage: String
    let name: String
    let location: String
    let rate: Double
}


