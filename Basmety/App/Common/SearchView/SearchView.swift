//
//  SearchView.swift
//  Basmety
//
//  Created by OSX on 25/08/2021.
//

import UIKit


class SearchView: UIView {
    
    //MARK: Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var searchText: UILabel!
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var filterImage: UIImageView!
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        //let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
        //nib.instantiate(withOwner: self, options: nil)
        Bundle.main.loadNibNamed("SearchView", owner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        self.adjustView(cornerRadius: 8, borderWidth: 1, borderColor: ColorsManager.pickedColor(color: .penkishRed), clipsToBounds: true, backGroundColor: .white)
        searchImage.image = UIImage.init(systemName: "magnifyingglass")
        filterImage.image = UIImage.init(systemName: "line.fill")
        adjustView(cornerRadius: 8, borderWidth: 1, borderColor: ColorsManager.pickedColor(color: .penkishRed), clipsToBounds: true, backGroundColor: .white)
        searchText.adjustLabel(text: "Search by Salon of service name..", textColor: ColorsManager.pickedColor(color: .customGray), fontSize: 17, fontType: .regular)
    }
}


