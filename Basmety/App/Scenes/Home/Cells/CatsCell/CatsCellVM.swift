//
//  CatsCellVM.swift
//  Basmety
//
//  Created by Mac on 30/08/2021.
//

import Foundation

struct CatsCellVM {
    
    let image: String
    let title: String
    
    init(_ model: CatsModel) {
        self.image = model.image
        self.title = model.title
    }
}


struct CatsModel {
    let image: String
    let title: String
}


