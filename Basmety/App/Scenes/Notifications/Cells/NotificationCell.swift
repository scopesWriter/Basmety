//
//  NotificationCell.swift
//  Basmety
//
//  Created by Mac on 01/09/2021.
//

import UIKit

class NotificationCell: UITableViewCell {

    //MARK: Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var locationImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.applyShadowLayer()
        mainImage.adjustView(cornerRadius: 8, borderWidth: 0, borderColor: .clear, clipsToBounds: true, backGroundColor: .white)
        firstLabel.adjustLabel(text: "", textColor: ColorsManager.pickedColor(color: .customGray), fontSize: 18, fontType: .medium)
        secondLabel.adjustLabel(text: "", textColor: ColorsManager.pickedColor(color: .customGray), fontSize: 14, fontType: .regular)
        thirdLabel.adjustLabel(text: "", textColor: ColorsManager.pickedColor(color: .customGray), fontSize: 12, fontType: .regular)
        date.adjustLabel(text: "", textColor: ColorsManager.pickedColor(color: .customGray), fontSize: 18, fontType: .medium)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    var viewModel: NotificationCellVM? {
        didSet {
            guard let viewModel = viewModel else { return }
            self.mainImage.image = UIImage(named: viewModel.image)
            self.firstLabel.text = viewModel.firstTitle
            self.secondLabel.text = viewModel.secondTitle
            self.thirdLabel.text = viewModel.thirdTitle
            self.date.text = viewModel.date
        }
    }
    
}
