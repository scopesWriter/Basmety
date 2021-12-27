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

class AppCoordinator: ViewCoordinator<AppRoute> {
    
    // MARK: Initialization
    init() {
        super.init(rootViewController: UIViewController(), initialRoute: .configScreen)
    }
    
    override func prepareTransition(for route: AppRoute) -> ViewTransition {
        switch route {
        case .configScreen:
            let configVC = ConfigScreenVC(
                viewModel: ConfigScreenVM(
                    router: weakRouter,
                    useCase: MovieDetailsUseCase.init(movieID: 10, moviesRepository: RepoImpl())
                )
            )
            configVC.modalPresentationStyle = .overFullScreen
            return .switchTo(configVC, in: rootViewController)
        case .onBoard:
            let onBoardVC = OnBoardVC(
                viewModel: OnBoardVM(
                    router: weakRouter,
                    useCase: MovieDetailsUseCase.init(movieID: 10, moviesRepository: RepoImpl())
                )
            )
            onBoardVC.modalPresentationStyle = .overFullScreen
            return .switchTo(onBoardVC, in: rootViewController)
        case .Login:
            let loginVC = LoginVC(
                viewModel: LoginVM(
                    router: weakRouter,
                    useCase: MovieDetailsUseCase.init(movieID: 10, moviesRepository: RepoImpl())
                )
            )
            loginVC.modalPresentationStyle = .overFullScreen
            return .switchTo(loginVC, in: rootViewController)
        case .register:
            return .dismiss()
        case .mainCoordinator:
            let coordinator = MainCoordinator()
            return .switchTo(coordinator, in: rootViewController)
        }
    }
    
  
}

