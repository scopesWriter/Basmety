//
//  MainCoordinator.swift
//  Basmety
//
//  Created by Mac on 29/08/2021.
//

import Foundation
import XCoordinator

enum MainRoute: Route {
    case home
    case offers
    case profile
    case favorites
    case dismiss
}


class MainCoordinator: TabBarCoordinator<MainRoute> {
    
    // MARK: Initialization
    init() {
        
        // app tab bar
        let appTabBarController = CustomTabBarController()
        super.init(rootViewController: appTabBarController, initialRoute: .home)
        
        // Home
        let HomeVC = HomeVC(
            viewModel: HomeVM(
                router: weakRouter,
                useCase: MovieDetailsUseCase.init(movieID: 1, moviesRepository: RepoImpl())
            )
        )
        
        // Home Bar Button Item
        let homeBarItem = UITabBarItem.init(title: "Home", image: UIImage.init(systemName: "house"), tag: 0)
        HomeVC.tabBarItem = homeBarItem
        // Home Navigation Controller
        let homeNavController = UINavigationController.init(rootViewController: HomeVC)
        
        //        // Offers
        let OffersVC = OffersVC(
            viewModel: OffersVM(
                router: weakRouter,
                useCase: MovieDetailsUseCase.init(movieID: 1, moviesRepository: RepoImpl())
            )
        )
        //Offers Bar Button Item
        let offersBarItem = UITabBarItem.init(title: "Offers", image: UIImage.init(systemName: "giftcard.fill"), tag: 1)
        OffersVC.tabBarItem = offersBarItem
        let offersNavController = UINavigationController.init(rootViewController: OffersVC)
        
        //        // Profile
        let ProfileVC = ProfileVC(
            viewModel: ProfileVM(
                router: weakRouter,
                useCase: MovieDetailsUseCase.init(movieID: 1, moviesRepository: RepoImpl())
            )
        )
        //Profile Bar Button Item
        let ProfileBarButtonItem = UITabBarItem.init(title: "Profile", image: UIImage.init(systemName: "person"), tag: 1)
        ProfileVC.tabBarItem = ProfileBarButtonItem
        let profileNavController = UINavigationController.init(rootViewController: ProfileVC)
        //
        
        // Favorites
        let favoritesVC = FavoritesVC(
            viewModel: FavoritesVM(
                router: weakRouter,
                useCase: MovieDetailsUseCase.init(movieID: 1, moviesRepository: RepoImpl())
            )
        )
        //Favorites Bar Button Item
        let favoritesBarbuttonItem = UITabBarItem.init(title: "Favorites", image: UIImage.init(systemName: "heart"), tag: 2)
        favoritesVC.tabBarItem = favoritesBarbuttonItem
        let favorietsNavController = UINavigationController.init(rootViewController: favoritesVC)
        
        
        appTabBarController.viewControllers = [homeNavController, offersNavController, favorietsNavController, profileNavController]
    }
    
    // MARK: Overrides
    
    override func prepareTransition(for route: MainRoute) -> TabBarTransition {
        switch route {
        case .home:
            return .select(index: 0)
        case .offers:
            return .select(index: 1)
        case .favorites:
            return .select(index: 2)
        case .profile:
            return .select(index: 3)
        case .dismiss:
            return .dismiss()
        }
    }
    
    
}
