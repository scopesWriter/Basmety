//
//  ProfileCell.swift
//  Basmety
//
//  Created by Mac on 30/08/2021.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        mainLabel.adjustLabel(text: "", textColor: ColorsManager.pickedColor(color: .customGray), fontSize: 18, fontType: .regular)
        mainImage.contentMode = .scaleAspectFit
        mainImage.tintColor = ColorsManager.pickedColor(color: .customGray)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    var viewModel: ProfileCellVM? {
        didSet {
            guard let viewModel = viewModel else { return }
            self.mainLabel.text = viewModel.title.localized
            self.mainImage.image = UIImage(systemName: viewModel.image)
        }
    }
    
}
