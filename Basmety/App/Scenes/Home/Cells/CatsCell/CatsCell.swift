//
//  CatsCell.swift
//  Basmety
//
//  Created by Mac on 30/08/2021.
//

import UIKit

class CatsCell: UICollectionViewCell {

    //MARK: Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainLabel.adjustLabel(text: "Categories", textColor: ColorsManager.pickedColor(color: .penkishRed), fontSize: 16, fontType: .regular, alignment: .centered)
        mainView.backgroundColor = .white
        mainImage.contentMode = .scaleAspectFit
    }
    
    /// Categories Cell ViewModel
    var viewModel: CatsCellVM? {
        didSet {
            guard let viewModel = viewModel else { return }
            self.mainLabel.text = viewModel.title
            self.mainImage.loadImage(With: viewModel.image)
        }
    }
}
