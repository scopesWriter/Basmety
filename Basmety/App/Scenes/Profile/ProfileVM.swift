//
//  ProfileVM.swift
//  Basmety
//
//  Created by Mac on 29/08/2021.
//

import Foundation
import RxSwift
import RxCocoa
import XCoordinator

class ProfileVM: ViewModel {
    
    // MARK: - Private properties
    private let disposeBag = DisposeBag()
    private let router: WeakRouter<MainRoute>
    private let useCase: MovieDetailsUseCase
    
    let input: Input
    
    //MARK: Input Private properties
    let didSelectItemSubject: PublishSubject<Int> = .init()
    let notificationSubject: PublishSubject<Any> = .init()
    let editProfileSubject: PublishSubject<Any> = .init()
    
    struct Input {
        let didSelectItem: AnyObserver<Int>
        let notificationTapped: AnyObserver<Any>
        let editProfileTapped: AnyObserver<Any>
    }
    
    //MARK: Output Private properties
    let profileSectionsBehavior: BehaviorRelay<[ProfileCellVM]> = .init(value: [.init(.init(image: "location.fill.viewfinder", title: "My Addresses")),
                                                                                .init(.init(image: "bell.fill", title: "Notification")),
                                                                                .init(.init(image: "arrow.left.arrow.right", title: "Language ")),
                                                                                .init(.init(image: "questionmark.circle.fill", title: "About app")),
                                                                                .init(.init(image: "arrowshape.turn.up.left.fill", title: "LOG OUT"))])
    
    let output: Output
    
    struct Output {
        let profileSections: Driver<[ProfileCellVM]>
    }
    
    init(router: WeakRouter<MainRoute>, useCase: MovieDetailsUseCase) {
        self.router = router
        self.useCase = useCase
        
        output = Output(profileSections: profileSectionsBehavior.asDriver())
        input = Input(didSelectItem: didSelectItemSubject.asObserver(), notificationTapped: notificationSubject.asObserver(), editProfileTapped: editProfileSubject.asObserver())
        
        // Inputs
        didSelectItemSubject.subscribe { index in
            guard let selectedIndex = index.element else { return }
            switch selectedIndex {
            case 0: router.trigger(.profile)
            case 1: router.trigger(.profile)
            case 2: router.trigger(.profile)
            case 3: router.trigger(.profile)
            case 4: router.trigger(.profile)
            default: break
            }
        }
        .disposed(by: disposeBag)
    }
    
}

