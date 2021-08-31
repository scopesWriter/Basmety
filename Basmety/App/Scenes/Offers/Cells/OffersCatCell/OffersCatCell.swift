//
//  OffersCatCell.swift
//  Basmety
//
//  Created by Mac on 30/08/2021.
//

import UIKit

class OffersCatCell: UICollectionViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.adjustView(cornerRadius: 20, borderWidth: 0, borderColor: .clear, clipsToBounds: true, backGroundColor: ColorsManager.pickedColor(color: .customGray))
        mainLabel.adjustLabel(text: "Spa", textColor: .white, fontSize: 14, fontType: .regular, alignment: .centered)
    }

}
