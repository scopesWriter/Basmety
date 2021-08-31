//
//  AppCoordinator.swift
//  Basmety
//
//  Created by Bishoy Badie on 29/08/2021.
//

import UIKit
import XCoordinator

enum AppRoute: Route {
    case configScreen
    case onBoard
    case Login
    case register
    case mainCoordinator
}

class AppCoordinator: NavigationCoordinator<AppRoute> {
    
    // MARK: Initialization
    init() {
        super.init(initialRoute: .configScreen)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .configScreen:
            let configVC = ConfigScreenVC(
                viewModel: ConfigScreenVM(
                    router: weakRouter,
                    useCase: MovieDetailsUseCase.init(movieID: 10, moviesRepository: RepoImpl())
                )
            )
            configVC.modalPresentationStyle = .overFullScreen
            return .present(configVC)
        case .onBoard:
            let onBoardVC = OnBoardVC(
                viewModel: OnBoardVM(
                    router: weakRouter,
                    useCase: MovieDetailsUseCase.init(movieID: 10, moviesRepository: RepoImpl())
                )
            )
            onBoardVC.modalPresentationStyle = .overFullScreen
            return .present(onBoardVC)
        case .Login:
            let loginVC = LoginVC(
                viewModel: LoginVM(
                    router: weakRouter,
                    useCase: MovieDetailsUseCase.init(movieID: 10, moviesRepository: RepoImpl())
                )
            )
            loginVC.modalPresentationStyle = .overFullScreen
            return .present(loginVC)
        case .register:
            return .dismiss()
        case .mainCoordinator:
            let coordinator = MainCoordinator.init()
            coordinator.rootViewController.modalPresentationStyle = .overFullScreen
            return .present(coordinator)
        }
    }
    
}

