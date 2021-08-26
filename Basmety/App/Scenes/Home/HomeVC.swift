//
//  HomeVC.swift
//  Basmety
//
//  Created by OSX on 25/08/2021.
//

import UIKit

class HomeVC: UIViewController {
    
    lazy var barTitle: UILabel = {
        let label = UILabel.init(frame: .zero)
        label.adjustLabel(text: "Home", textColor: ColorsManager.pickedColor(color: .penkishRed), fontSize: 20, fontType: .bold, alignment: .centered)
        return label
    } ()
    
    //MARK: Outlets
    @IBOutlet weak var homeCV: UICollectionView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var secondaryTitle: UILabel!
//    @IBOutlet weak var searchView: SearchView!
    @IBOutlet weak var corneredView: UIView!
    @IBOutlet weak var notificationButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }
    
    private func setupUI() {
        configCollectionView()
        navigationCustomizations()
    }
    
    
    private func configCollectionView() {
        
    }
    
    private func bind() {
        
    }
    
    private func navigationCustomizations() {
        navigationController?.navigationBar.barTintColor = ColorsManager.pickedColor(color: .penkishRed)
        navigationController?.navigationBar.isTranslucent = false
    }
}
