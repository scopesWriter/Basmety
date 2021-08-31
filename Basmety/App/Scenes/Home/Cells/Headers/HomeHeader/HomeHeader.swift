//
//  HomeHeader.swift
//  Basmety
//
//  Created by Mac on 30/08/2021.
//

import UIKit

class HomeHeader: UICollectionReusableView {

    //MARK: Outlets
    @IBOutlet weak var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainLabel.adjustLabel(text: "", textColor: ColorsManager.pickedColor(color: .penkishRed), fontSize: 18, fontType: .regular)
    }
    
}
