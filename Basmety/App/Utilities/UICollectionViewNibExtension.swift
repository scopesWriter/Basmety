//
//  UICollectionViewNibExtension.swift
//  GAC Certificates
//
//  Created by Kerolles Roshdi on 4/16/20.
//  Copyright © 2020 ExpertApps. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerCellNib<Cell: UICollectionViewCell>(cellClass: Cell.Type){
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: Cell.self))
    }
    
}
