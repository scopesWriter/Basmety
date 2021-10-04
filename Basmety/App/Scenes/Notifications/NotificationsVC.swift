//
//  NotificationsVC.swift
//  Basmety
//
//  Created by Mac on 01/09/2021.
//

import UIKit

class NotificationsVC: BaseViewController<NotificationVM> {
    
    //MARK: Outlets
    @IBOutlet weak var mainTV: UITableView!
    @IBOutlet weak var corneredView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    /// Settings navigation with penkish red background and make it clear , bartitle intergation
    private func navigationCustomizations() {
        //navigationItem.titleView = barTitle
        let customvView = UIBarButtonItem.init(customView: createCustomView())
        navigationItem.leftBarButtonItem = customvView
    }
    
    /// A function used to create custom view to be added as a BarButtonItem
    /// - Returns: UiBarButtonCustomView
    private func createCustomView() -> UIView {
        let firstLabel: UILabel = UILabel.init(frame: .zero)
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.adjustLabel(text: "Notifications", textColor: .white, fontSize: 18, fontType: .bold)
        return firstLabel
    }
    
    private func setupUI() {
        corneredView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        corneredView.layer.cornerRadius = 20
        corneredView.clipsToBounds = true
        navigationCustomizations()
        mainTV.registerNib(cell: NotificationCell.self)
        mainTV.rx.setDelegate(self).disposed(by: disposeBag)
                
        viewModel.output.notifcaitionItems.drive(mainTV.rx.items(cellIdentifier: "NotificationCell", cellType: NotificationCell.self)) { index, vm, cell in
            cell.viewModel = vm
        }
        .disposed(by: disposeBag)
    }

    private func createEmptyView() -> UIView {
        let view: UIView = UIView.init(frame: .zero)
        view.backgroundColor =  .white
        let mainSV: UIStackView = .init(frame: .zero)
        let image: UIImageView = .init(frame: .zero)
        let text: UILabel = UILabel(frame: .zero)
        image.image = UIImage(named: "empty")
        text.text = "No Favouriets yet"
        mainSV.addArrangedSubview(image)
        mainSV.addArrangedSubview(text)
        mainSV.axis = .vertical
        mainSV.spacing = 0
        mainSV.distribution = .fill
        mainSV.alignment = .fill
        text.setContentHuggingPriority(.defaultHigh, for: .vertical)
        NSLayoutConstraint.activate([
            mainSV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainSV.topAnchor.constraint(equalTo: view.bottomAnchor),
            mainSV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainSV.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        return view
    }
    
}

extension NotificationsVC: UITableViewDelegate { }
