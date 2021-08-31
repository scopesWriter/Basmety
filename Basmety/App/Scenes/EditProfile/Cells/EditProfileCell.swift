//
//  EditProfileCell.swift
//  Basmety
//
//  Created by Mac on 31/08/2021.
//

import UIKit

class EditProfileCell: UITableViewCell {

    //MARK:Outlets
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        firstLabel.adjustLabel(text: "", textColor: ColorsManager.pickedColor(color: .customGray), fontSize: 18, fontType: .regular)
        secondLabel.adjustLabel(text: "", textColor: .lightGray, fontSize: 16, fontType: .semibold)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    var viewModel: EditProfileCellVM? {
        didSet {
            guard let viewModel  = viewModel else { return }
            self.firstLabel.text = viewModel.firstTitle
            self.secondLabel.text = viewModel.secondTitle
            self.mainImage.image = UIImage(systemName: viewModel.image)
        }
    }
    
}
