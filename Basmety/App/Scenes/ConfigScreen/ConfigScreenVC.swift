//
//  ConfigScreenVC.swift
//  Basmety
//
//  Created by OSX on 17/08/2021.
//

import UIKit

class ConfigScreenVC: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var mainLogo: UIImageView!
    @IBOutlet weak var arabicText: UILabel!
    @IBOutlet weak var englishText: UILabel!
    @IBOutlet weak var countrySelectionEnglish: UILabel!
    @IBOutlet weak var countrySelectionArabic: UILabel!
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var arabicButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setupUI()
    }
    
    private func setupUI() {
        
    }
    
    private func bind() {
        
    }
    
    @IBAction func languageButtonPressed(_ sender: UIButton) {
        switch sender {
        case self.englishButton:
            print("a7a")
        case self.arabicButton:
            print("a7a")
        default:
            print("a7a")
        }
    }
    
}
