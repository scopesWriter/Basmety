//
//  OffersCell.swift
//  Basmety
//
//  Created by Mac on 30/08/2021.
//

import UIKit

class OffersCell: UICollectionViewCell {

    //MARK: Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var summerOfferView: UIView!
    @IBOutlet weak var summerOfferImage: UIImageView!
    @IBOutlet weak var summerOfferTitle: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var rateImage: UIImageView!
    @IBOutlet weak var transparentLayer: UIView!
    
    var likeClosure: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Main View
        mainView.adjustView(cornerRadius: 16, borderWidth: 0, borderColor: .clear, clipsToBounds: true, backGroundColor: .white)
        //Name
        name.adjustLabel(text: "Viola Salon", textColor: .white, fontSize: 18, fontType: .regular)
        // Main Image
        mainImage.contentMode = .scaleAspectFit
        backgroundImage.contentMode = .scaleToFill
        //Rate
        rateImage.image = UIImage(systemName: "star.fill")?.withTintColor(.white)
        rateLabel.adjustLabel(text: "3.5/5.0", textColor: .white, fontSize: 12, fontType: .regular)
        //Location
        locationLabel.adjustLabel(text: "Abu Dahbi", textColor: .white, fontSize: 16, fontType: .regular)
        locationImage.image = UIImage(systemName: "location.fill.viewfinder")?.withTintColor(.white)
        //Like button
        likeButton.setImage(UIImage(systemName: "heart.fill")?.withTintColor(.white), for: .normal)
        //Summer Offer optimizations
        summerOfferTitle.adjustLabel(text: "SUMMER OFFER", textColor: ColorsManager.pickedColor(color: .penkishRed), fontSize: 16, fontType: .semibold)
        summerOfferView.backgroundColor = ColorsManager.pickedColor(color: .postag)
        //Transparent layer
        transparentLayer.backgroundColor = ColorsManager.pickedColor(color: .penkishRed)
        transparentLayer.alpha = 0.55
    }

    @IBAction func likeClicked() {
        likeClosure?()
    }
}
