//
//  WizardCell.swift
//  Basmety
//
//  Created by OSX on 18/08/2021.
//

import UIKit

class WizardCell: UICollectionViewCell {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainImage.contentMode = .scaleAspectFit
        
    }
    
    var viewModel: WizardCellVM? {
        didSet {
            guard let viewModel = viewModel else { return }
            self.mainTitle.text = viewModel.title
            self.desc.text = viewModel.desc
            self.mainImage.image = UIImage(named:viewModel.image)
        }
    }

}
