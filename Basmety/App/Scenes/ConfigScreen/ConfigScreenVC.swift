//
//  ConfigScreenVC.swift
//  Basmety
//
//  Created by Bishoy Badie on 17/08/2021.
//

import UIKit

class ConfigScreenVC: BaseViewController<ConfigScreenVM> {
    
    //MARK: Outlets
    @IBOutlet weak var mainLogo: UIImageView!
    @IBOutlet weak var arabicText: UILabel!
    @IBOutlet weak var englishText: UILabel!
    @IBOutlet weak var countrySelectionEnglish: UILabel!
    @IBOutlet weak var countrySelectionArabic: UILabel!
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var arabicButton: UIButton!
    @IBOutlet weak var countriesList: UIPickerView!
    @IBOutlet weak var chooseCountryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setupUI()
    }
    
    private func setupUI() {
        arabicButton.stylingButton(cornerRadius: 8, borderWidth: 1, borderColor: .lightGray, clipsToBounds: true)
        englishButton.stylingButton(cornerRadius: 8, borderWidth: 1, borderColor: .lightGray, clipsToBounds: true)
        getStartedButton.stylingButton(cornerRadius: 8, borderWidth: 1, borderColor: .lightGray, clipsToBounds: true, backgroundColor: ColorsManager.pickedColor(color: .penkishRed))
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(chooseCountryTapped))
        chooseCountryLabel.isUserInteractionEnabled = true
        chooseCountryLabel.addGestureRecognizer(tap)
        countriesList.delegate = self
    }
    
    @objc func chooseCountryTapped() {
        countriesList.isHidden = false
    }
    
    private func bind() {
        // get started action
        getStartedButton.rx.tap.subscribe { [weak self] tap in
            guard let self = self else { return }
            Log.d(())
            self.viewModel.input.getStartedTapped.onNext(true)
        }.disposed(by: disposeBag)
        
        arabicButton.rx.tap.subscribe { [weak self] tap in
            guard let self = self else { return }
            Log.d(())
            self.deSelectButton(button: self.englishButton)
            self.selectButton(button: self.arabicButton)
        }.disposed(by: disposeBag)
        
        englishButton.rx.tap.subscribe { [weak self] tap in
            guard let self = self else { return }
            Log.d(())
            self.selectButton(button: self.englishButton)
            self.deSelectButton(button: self.arabicButton)
        }.disposed(by: disposeBag)
        
    }
    
    @IBAction func languageButtonPressed(_ sender: UIButton) {
        switch sender {
        case self.englishButton:
            print("a")
        case self.arabicButton:
            print("a")
        default:
            print("a")
        }
    }
    
    private func selectButton(button: UIButton) {
        button.stylingButton(cornerRadius: 8, borderWidth: 1, borderColor: .lightGray, clipsToBounds: true, backgroundColor: ColorsManager.pickedColor(color: .penkishRed))
        button.setTitleColor(.white, for: .normal)
    }
    
    private func deSelectButton(button: UIButton) {
        button.setTitleColor(ColorsManager.pickedColor(color: .customGray), for: .normal)
        button.stylingButton(cornerRadius: 8, borderWidth: 1, borderColor: .lightGray, clipsToBounds: true)
    }
    
}

extension ConfigScreenVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Egypt"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countriesList.isHidden = true
    }
    
}
