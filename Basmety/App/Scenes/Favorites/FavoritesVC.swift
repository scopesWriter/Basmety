//
//  FavoritesVC.swift
//  Basmety
//
//  Created by Mac on 29/08/2021.
//

import UIKit

class FavoritesVC: BaseViewController<FavoritesVM> {
    
    //MARK: Outlets
    @IBOutlet weak var corneredView: UIView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var mainCV: UICollectionView!
    @IBOutlet weak var pager: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        setpUI()
    }
    
    private func setpUI() {
        navigationCustomizations()
        configCollectionView()
        pagerOptimizations()
        corneredView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        corneredView.layer.cornerRadius = 20
        corneredView.clipsToBounds = true
        searchView.applyShadowLayer()
    }
    
    private func pagerOptimizations() {
        pager.selectedSegmentTintColor = ColorsManager.pickedColor(color: .penkishRed)
        pager.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Poppins-SemiBold", size: 16) as Any, NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
    }
    
    @IBAction func segmentedControlTapped(segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0: print("0")
        case 1: print("1")
        default: break
        }
    }

    /// Settings navigation with penkish red background and make it clear , bartitle intergation
    private func navigationCustomizations() {
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
        firstLabel.adjustLabel(text: "My Favourites", textColor: .white, fontSize: 18, fontType: .bold)
        return firstLabel
    }
    
    /// Tells the view model to trigger via router
    @objc func notificationTapped() {
        // notify viewModel to trigger to notificationsVC
        //viewModel.input.notificationTapped.onNext(true)
    }
    
    private func configCollectionView() {
        mainCV.delegate = self
        mainCV.dataSource = self
        mainCV.registerNib(cell: OffersCell.self)
        mainCV.registerHeader(header: AdsHeader.self)
        mainCV.registerHeader(header: HomeHeader.self)
        mainCV.collectionViewLayout = createCompositionalLayout()
    }
    
    //MARK: A function used to create compositional layout .
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout.init { [weak self] (index, environment) -> NSCollectionLayoutSection? in
            return self?.createSectionFor(index: index, environment: environment)
        }
        return layout
    }
    
    func createSectionFor(index: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch index {
        case 1:
            return createThirdSection()
        default:
            return createFirstSection()
        }
    }
    
    // Slider Section
    func createFirstSection() -> NSCollectionLayoutSection {
        let inset: CGFloat = 2.5
        // Item
        let itemSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem.init(layoutSize: itemSize)
        item.contentInsets = .init(top: inset, leading: inset, bottom: inset, trailing: inset)
        // Group
        let groupSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        // header
        let headerSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(80))
        let header = NSCollectionLayoutBoundarySupplementaryItem.init(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        // Section
        let section = NSCollectionLayoutSection.init(group: group)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    // Vendors Section
    func createThirdSection() -> NSCollectionLayoutSection {
        let inset: CGFloat = 2.5
        // Item
        let itemSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem.init(layoutSize: itemSize)
        item.contentInsets = .init(top: inset, leading: inset, bottom: inset, trailing: inset)
        // Group
        let groupSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.35))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        // header
        let headerSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(35))
        let header = NSCollectionLayoutBoundarySupplementaryItem.init(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        // Section
        let section = NSCollectionLayoutSection.init(group: group)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
}

extension FavoritesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return 10
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCatCell", for: indexPath) as? OffersCatCell else { return UICollectionViewCell() }
        return cell
        } else if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCell", for: indexPath) as? OffersCell else { return UICollectionViewCell() }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCatCell", for: indexPath) as? OffersCatCell else { return UICollectionViewCell() }
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.section  == 0 {
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "AdsHeader", for: indexPath) as? AdsHeader else { return UICollectionReusableView() }
            view.mainImage.image = UIImage(named: "Intersection 2")
            return view
        }
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeader", for: indexPath) as? HomeHeader else { return UICollectionReusableView() }
        view.mainLabel.text = "SPA"
        return view
    }
    
}
