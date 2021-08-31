//
//  ServicesCell.swift
//  Basmety
//
//  Created by Mac on 31/08/2021.
//

import UIKit

class ServicesCell: UICollectionViewCell {

    //MARK: Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var locationImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.adjustView(cornerRadius: 8, borderWidth: 0, borderColor: .clear, clipsToBounds: true, backGroundColor: ColorsManager.pickedColor(color: .pink))
        likeButton.setImage(UIImage.init(systemName: "heart.fill")?.withTintColor(ColorsManager.pickedColor(color: .penkishRed)), for: .normal)
        mainImage.applyShadowLayer(cornerRadius: 25, shadowOpacity: 0.125)
        location.adjustLabel(text: "", textColor: .white, fontSize: 16, fontType: .regular)
        price.adjustLabel(text: "L.E", textColor: .white, fontSize: 18, fontType: .bold)
        name.adjustLabel(text: "Bishoy badie", textColor: .white, fontSize: 20, fontType: .bold)
        mainTitle.adjustLabel(text: "", textColor: ColorsManager.pickedColor(color: .penkishRed), fontSize: 20, fontType: .semibold)
    }
    
    var viewModel: ServicesCellVM? {
        didSet {
            guard let viewModel = viewModel else { return }
            self.mainImage.image = UIImage(systemName: viewModel.image)
            self.price.text = "\(viewModel.price)"
            self.location.text = viewModel.location
            self.mainTitle.text = viewModel.title
            self.name.text = viewModel.name
        }
    }

}
