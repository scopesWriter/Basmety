//
//  AdsHeader.swift
//  Basmety
//
//  Created by Mac on 30/08/2021.
//

import UIKit

class AdsHeader: UICollectionReusableView {

    //MARK: Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainImage.contentMode = .scaleToFill
    }
    
}
