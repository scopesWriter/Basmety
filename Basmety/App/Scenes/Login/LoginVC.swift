//
//  LoginVC.swift
//  Basmety
//
//  Created by OSX on 17/08/2021.
//

import UIKit

class LoginVC: BaseViewController<LoginVM> {

    //MARK: Outlets
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var loginTitle: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var remindMe: UILabel!
    @IBOutlet weak var remindMeButton: UIButton!
    @IBOutlet weak var dontHaveAccount: UILabel!
    @IBOutlet weak var emailTitle: UILabel!
    @IBOutlet weak var passwordTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }
    
    private func setupUI() {
        shadowView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        shadowView.applyShadowLayer(cornerRadius: 50, shadowOpacity: 0.1)
        loginTitle.adjustLabel(text: "Login", textColor: ColorsManager.pickedColor(color: .penkishRed), fontSize: 20, fontType: .bold, alignment: .centered)
        emailTF.adjustTextField(text: "", textColor: .lightGray, placeHolderText: "example@gmail.com", fontSize: 16, fontType: .regular)
        emailTF.backgroundColor = UIColor.init(red: 234/255, green: 236/255, blue: 242/255, alpha: 1)
        passwordTF.backgroundColor = UIColor.init(red: 234/255, green: 236/255, blue: 242/255, alpha: 1)
        passwordTF.adjustTextField(text: "", textColor: .lightGray, placeHolderText: "set new password", fontSize: 16, fontType: .regular)
        remindMe.adjustLabel(text: "remind me", textColor: ColorsManager.pickedColor(color: .customGray), fontSize: 14, fontType: .regular)
        loginButton.adjustButton(text: "Login", textColor: .white, fontSize: 18, fontType: .bold)
        loginButton.stylingButton(cornerRadius: 8, borderWidth: 0, borderColor: .clear, clipsToBounds: true, backgroundColor: ColorsManager.pickedColor(color: .penkishRed))
        forgetPasswordButton.adjustButton(text: "Forget password ?", textColor: ColorsManager.pickedColor(color: .penkishRed), fontSize: 16, fontType: .semibold)
        registerButton.adjustButton(text: "Register", textColor: ColorsManager.pickedColor(color: .penkishRed), fontSize: 14, fontType: .semibold)
        dontHaveAccount.adjustLabel(text: "Don't have account", textColor: ColorsManager.pickedColor(color: .customGray), fontSize: 14, fontType: .regular)
        emailTitle.adjustLabel(text: "Email", textColor: ColorsManager.pickedColor(color: .customGray), fontSize: 18, fontType: .regular)
        passwordTitle.adjustLabel(text: "Password", textColor: ColorsManager.pickedColor(color: .customGray), fontSize: 18, fontType: .regular)
    }
    
    private func bind() {
        
    }

}
