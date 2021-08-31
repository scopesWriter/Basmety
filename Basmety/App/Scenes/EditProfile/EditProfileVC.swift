//
//  EditProfileVC.swift
//  Basmety
//
//  Created by Mac on 31/08/2021.
//

import UIKit

class EditProfileVC: BaseViewController<EditProfileVM> {
    
    //MARK: Outlets
    @IBOutlet weak var corneredView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var mainTV: UITableView!
    @IBOutlet weak var captureImage: UIButton!
    @IBOutlet weak var profileView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }
    
    private func setupUI() {
        configureTableView()
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: createCustomView())
        corneredView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        corneredView.layer.cornerRadius = 20
        corneredView.clipsToBounds = true
        profileView.applyShadowLayer(cornerRadius: 50, shadowOpacity: 0.125)
        profileView.layer.borderWidth = 1
        profileView.layer.borderColor = ColorsManager.pickedColor(color: .penkishRed).cgColor
        profileImage.adjustView(cornerRadius: 40, borderWidth: 0, borderColor: .clear, clipsToBounds: true, backGroundColor: .white)
        profileImage.contentMode = .scaleToFill
    }
    
    /// A function used to create custom view to be added as a BarButtonItem
    /// - Returns: UiBarButtonCustomView
    private func createCustomView() -> UIView {
        let firstLabel: UILabel = UILabel.init(frame: .zero)
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.adjustLabel(text: "Edit Profile", textColor: .white, fontSize: 18, fontType: .bold)
        return firstLabel
    }
    
    /// Configure Table view in Rx Way
    private func configureTableView() {
        mainTV.registerNib(cell: EditProfileCell.self)
        mainTV.rx.setDelegate(self).disposed(by: disposeBag)
        
        mainTV.rx.itemSelected.subscribe { [weak self] indexPath in
            self?.viewModel.input.itemSelected.onNext(indexPath.row)
        }
        .disposed(by: disposeBag)
        
        viewModel.output.editProfileItems.drive(mainTV.rx.items(cellIdentifier: "EditProfileCell", cellType: EditProfileCell.self)) { index, vm, cell in
            cell.viewModel = vm
        }.disposed(by: disposeBag)
    }
    
    private func bind() {
        captureImage.rx.tap.subscribe { [weak self] _ in
            self?.openGallery()
        }.disposed(by: disposeBag)
    }
    
    /// Used this manager to open Image picker and return selected image using a call back called pick image.
    private func openGallery() {
        ImagePickerManager().pickImage(self) { [weak self] image in
            //here is the image
            self?.profileImage.image = image
        }
    }
    
}

extension EditProfileVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
