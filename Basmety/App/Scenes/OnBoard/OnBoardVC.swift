//
//  OnBoardVC.swift
//  Basmety
//
//  Created by OSX on 17/08/2021.
//
import CHIPageControl
import UIKit

class OnBoardVC: BaseViewController<OnBoardVM> {
    
    //MARK: Outlets
    @IBOutlet weak var wizardCV: UICollectionView!
    @IBOutlet weak var pager: CHIPageControlJalapeno!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var continueAsGuest: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }
    
    private func setupUI() {
        collectionViewConfigurations()
        pagerConfigurations()
        buttonsConfigurations()
        //MARK: shadow view
        shadowView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        shadowView.applyShadowLayer(cornerRadius: 30, shadowOpacity: 0.125)
    }
    
    private func buttonsConfigurations() {
        loginButton.stylingButton(cornerRadius: 8, borderWidth: 0, borderColor: .clear, clipsToBounds: true, backgroundColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        registerButton.stylingButton(cornerRadius: 8, borderWidth: 0, borderColor: .clear, clipsToBounds: true, backgroundColor: ColorsManager.pickedColor(color: .penkishRed))
        facebookButton.stylingButton(cornerRadius: 8, borderWidth: 0, borderColor: .clear, clipsToBounds: true, backgroundColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        googleButton.stylingButton(cornerRadius: 8, borderWidth: 0, borderColor: .clear, clipsToBounds: true, backgroundColor: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
    }
    
    private func pagerConfigurations() {
        pager.numberOfPages = 3
        pager.radius = 4
        pager.tintColor = ColorsManager.pickedColor(color: .customGray)
        pager.currentPageTintColor = ColorsManager.pickedColor(color: .penkishRed)
        pager.padding = 3
        pager.backgroundColor = .clear
        pager.hidesForSinglePage = true
    }
    
    private func collectionViewConfigurations() {
        wizardCV
            .registerNib(cell: WizardCell.self)
        wizardCV
            .rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        viewModel
            .output
            .wizardItems
            .drive(wizardCV.rx.items(cellIdentifier: String(describing: WizardCell.self), cellType: WizardCell.self)) { index, vm , cell in
                cell.viewModel = vm
            }
            .disposed(by: disposeBag)
    }
    
    private func bind() {
        loginButton
            .rx
            .tap
            .subscribe(onNext: { x in
                Log.d("Login")
            })
            .disposed(by: disposeBag)
        
        facebookButton
            .rx
            .tap
            .subscribe(onNext: { x in
                Log.d("Facebook")
            })
            .disposed(by: disposeBag)
        
        registerButton
            .rx
            .tap
            .subscribe(onNext: { x in
                Log.d("Register")
            })
            .disposed(by: disposeBag)
        
        googleButton
            .rx
            .tap
            .subscribe(onNext: { x in
                Log.d("Google")
            })
            .disposed(by: disposeBag)
        
        continueAsGuest
            .rx
            .tap
            .do(onNext: { [weak self] _ in
                    guard let self = self else { return }
                    self.viewModel.input.asGuestTapped.onNext(true)})
            .subscribe()
            .disposed(by: disposeBag)
    }
    
}

extension OnBoardVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pager.progress = Double(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return wizardCV.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
