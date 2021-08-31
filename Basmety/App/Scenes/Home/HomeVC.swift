//
//  HomeVC.swift
//  Basmety
//
//  Created by Bishoy Badie on 25/08/2021.
//

import UIKit

class HomeVC: BaseViewController<HomeVM> {
    
    
    var header: [String] = ["Categories", "", "Offers", "Most Popular"]

    //MARK: Outlets
    @IBOutlet weak var homeCV: UICollectionView!
    @IBOutlet weak var corneredView: UIView!
    @IBOutlet weak var searchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }
    
    /// Used to adjust all UI compnents
    private func setupUI() {
        configCollectionView()
        navigationCustomizations()
        corneredView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        corneredView.layer.cornerRadius = 20
        corneredView.clipsToBounds = true
        searchView.applyShadowLayer()
    }
    
    /// Registering Cells , Headers , Delegate and datSource of collection view with a compositional layout
    private func configCollectionView() {
        homeCV.rx.setDelegate(self).disposed(by: disposeBag)
        homeCV.dataSource = self
        homeCV.collectionViewLayout = createCompositionalLayout()
        homeCV.registerNib(cell: CatsCell.self)
        homeCV.registerHeader(header: HomeHeader.self)
        homeCV.registerNib(cell: OffersCell.self)
        homeCV.registerNib(cell: MostPopularCell.self)
        homeCV.registerHeader(header: AdsHeader.self)
    }
    
    /// used to bind data
    private func bind() {
        
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
        let mainView: UIView = UIView(frame: .zero)
        let mainSV: UIStackView = UIStackView(frame: .zero)
        let firstLabel: UILabel = UILabel.init(frame: .zero)
        let secondLabel: UILabel = UILabel.init(frame: .zero)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainSV.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.adjustLabel(text: "Hi There.. !", textColor: .white, fontSize: 16, fontType: .bold)
        secondLabel.adjustLabel(text: "Find Beauty Services nearby", textColor: .white, fontSize: 14, fontType: .regular)
        mainSV.addArrangedSubview(firstLabel)
        mainSV.addArrangedSubview(secondLabel)
        mainSV.alignment = .fill
        mainSV.distribution = .fillEqually
        mainSV.spacing = 0
        mainSV.axis = .vertical
        mainView.addSubview(mainSV)
        NSLayoutConstraint.activate([
            mainSV.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            mainSV.topAnchor.constraint(equalTo: mainView.topAnchor),
            mainSV.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            mainSV.trailingAnchor.constraint(equalTo: mainView.trailingAnchor)
        ])
        return mainView
    }
    
    /// Tells the view model to trigger via router
    @objc func notificationTapped() {
        // notify viewModel to trigger to notificationsVC
        viewModel.input.notificationTapped.onNext(true)
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
        case 0:
            return createFirstSection()
        case 1:
            return createSecondSection()
        case 2:
            return createThirdSection()
        case 3:
            return createFourthSection()
        default:
            return createFirstSection()
        }
    }
    
    // Slider Section
    func createFirstSection() -> NSCollectionLayoutSection {
        let inset: CGFloat = 2.5
        // Item
        let itemSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem.init(layoutSize: itemSize)
        item.contentInsets = .init(top: inset, leading: inset, bottom: inset, trailing: inset)
        // Group
        let groupSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        //header
        let headerSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(35))
        let header = NSCollectionLayoutBoundarySupplementaryItem.init(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        // Section
        let section = NSCollectionLayoutSection.init(group: group)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    // Sponsors Section
    func createSecondSection() -> NSCollectionLayoutSection {
        let inset: CGFloat = 2.5
        // Item
        let itemSize = NSCollectionLayoutSize.init(widthDimension: .absolute(0), heightDimension: .absolute(0))
        let item = NSCollectionLayoutItem.init(layoutSize: itemSize)
        item.contentInsets = .init(top: inset, leading: inset, bottom: inset, trailing: inset)
        // Group
        let groupSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 5)
        // header
        let headerSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(80))
        let header = NSCollectionLayoutBoundarySupplementaryItem.init(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        // Section
        let section = NSCollectionLayoutSection.init(group: group)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .none
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
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        // header
        let headerSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(35))
        let header = NSCollectionLayoutBoundarySupplementaryItem.init(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        // Section
        let section = NSCollectionLayoutSection.init(group: group)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    // Hot Discount Section
    func createFourthSection() -> NSCollectionLayoutSection {
        let inset: CGFloat = 2.5
        // Item
        let itemSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem.init(layoutSize: itemSize)
        item.contentInsets = .init(top: inset, leading: inset, bottom: inset, trailing: inset)
        // Group
        let groupSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.35))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        // header
        let headerSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(35))
        let header = NSCollectionLayoutBoundarySupplementaryItem.init(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        // Section
        let section = NSCollectionLayoutSection.init(group: group)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatsCell", for: indexPath) as? CatsCell else { return UICollectionViewCell() }
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCell", for: indexPath) as? OffersCell else { return UICollectionViewCell() }
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MostPopularCell", for: indexPath) as? MostPopularCell else { return UICollectionViewCell() }
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatsCell", for: indexPath) as? CatsCell else { return UICollectionViewCell() }
            return cell
        }
      
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return 0
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section  == 1 {
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "AdsHeader", for: indexPath) as? AdsHeader else { return UICollectionReusableView() }
            view.mainImage.image = UIImage(named: "Intersection 2")
            return view
        }
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeader", for: indexPath) as? HomeHeader else { return UICollectionReusableView() }
        view.mainLabel.text = header[indexPath.section]
        return view
    }
    
}


