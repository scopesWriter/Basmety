//
//  SearchView.swift
//  Basmety
//
//  Created by OSX on 25/08/2021.
//

import UIKit


class SaerchView: UIView {
    
    //MARK: Outlets
    @IBOutlet weak var searchText: UILabel!
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var filterImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        self.adjustView(cornerRadius: 8, borderWidth: 1, borderColor: ColorsManager.pickedColor(color: .penkishRed), clipsToBounds: true, backGroundColor: .white)
        searchText.adjustLabel(text: "Search by Salon of service name..", textColor: ColorsManager.pickedColor(color: .customGray), fontSize: 17, fontType: .regular)
        searchImage.image = UIImage.init(systemName: "magnifyingglass")
        filterImage.image = UIImage.init(systemName: "line.fill")
    }
}


