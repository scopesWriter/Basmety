//
//  CreateAccountVC.swift
//  Basmety
//
//  Created by OSX on 17/08/2021.
//

import UIKit

class CreateAccountVC: BaseViewController<CreateAccountVM> {

    //MARK: Outlets
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var createAccountTitle: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }
    
    private func setupUI() {
        
    }
    
    private func bind() {
        
    }

}
