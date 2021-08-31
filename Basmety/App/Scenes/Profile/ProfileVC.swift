//
//  ProfileVC.swift
//  Basmety
//
//  Created by Bishoy Badie on 29/08/2021.
//

import UIKit

class ProfileVC: BaseViewController<ProfileVM> {

    //MARK: Outlets
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var adsView: UIImageView!
    @IBOutlet weak var corneredView: UIView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var mainTV: UITableView!
    @IBOutlet weak var poweredBy: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var editProfileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }
    
    private func setupUI() {
        configureTableView()
        navigationCustomizations()
        corneredView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        corneredView.layer.cornerRadius = 20
        corneredView.clipsToBounds = true
        profileView.applyShadowLayer(cornerRadius: 50, shadowOpacity: 0.125)
        profileView.layer.borderWidth = 1
        profileView.layer.borderColor = ColorsManager.pickedColor(color: .penkishRed).cgColor
        profileImage.adjustView(cornerRadius: 40, borderWidth: 0, borderColor: .clear, clipsToBounds: true, backGroundColor: .white)
        username.adjustLabel(text: "Bishoy Badie", textColor: ColorsManager.pickedColor(color: .customGray), fontSize: 18, fontType: .bold, alignment: .centered)
        poweredBy.adjustLabel(text: "Powered By", textColor: ColorsManager.pickedColor(color: .customGray), fontSize: 16, fontType: .semibold)
        companyName.adjustLabel(text: "4F", textColor: ColorsManager.pickedColor(color: .penkishRed), fontSize: 18, fontType: .bold)
        adsView.image = #imageLiteral(resourceName: "Intersection 2")
        adsView.contentMode = .scaleToFill
        profileImage.image = #imageLiteral(resourceName: "Mask Group 5")
    }
    
    private func bind() {
        editProfileButton.rx.tap.subscribe { [weak self] _ in
            // Tell viewModel to trigger
            self?.viewModel.input.editProfileTapped.onNext(true)
        }
        .disposed(by: disposeBag)
    }
    
    /// Settings navigation with penkish red background and make it clear , bartitle intergation
    private func navigationCustomizations() {
        //navigationItem.titleView = barTitle
        let notificationButton = UIBarButtonItem().createBarButtonItem(self, action: #selector(notificationTapped), imageName: "bell", BadgeCount: 10)
        navigationItem.rightBarButtonItem = notificationButton
        let customvView = UIBarButtonItem.init(customView: createCustomView())
        navigationItem.leftBarButtonItem = customvView
    }
    
    /// A function used to create custom view to be added as a BarButtonItem
    /// - Returns: UiBarButtonCustomView
    private func createCustomView() -> UIView {
        let firstLabel: UILabel = UILabel.init(frame: .zero)
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.adjustLabel(text: "Profile", textColor: .white, fontSize: 18, fontType: .bold)
        return firstLabel
    }
    
    /// Tells the view model to trigger via router
    @objc func notificationTapped() {
        // notify viewModel to trigger to notificationsVC
        viewModel.input.notificationTapped.onNext(true)
    }
    
    private func configureTableView() {
        mainTV.registerNib(cell: ProfileCell.self)
        //Delagate
        mainTV
            .rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        // Data Source 
        viewModel.output.profileSections
            .drive(mainTV.rx.items(cellIdentifier: String(describing: ProfileCell.self), cellType: ProfileCell.self)) { index, vm , cell in
                cell.viewModel = vm
            }
            .disposed(by: disposeBag)
        // DidSelect Item in Rx way
        mainTV.rx
            .itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.viewModel.input.didSelectItem.onNext(indexPath.row)
            })
            .disposed(by: disposeBag)
    }

}

extension ProfileVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
