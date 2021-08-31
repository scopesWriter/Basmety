//
//  HomeVM.swift
//  Basmety
//
//  Created by OSX on 25/08/2021.
//

import Foundation
import RxCocoa
import RxSwift
import XCoordinator

class HomeVM: ViewModel {
    
    // MARK: - Private properties
    private let disposeBag = DisposeBag()
    private let router: WeakRouter<MainRoute>
    private let useCase: MovieDetailsUseCase
    
    let input: Input
    
    //MARK: Input Private properties
    let notificationSubject = PublishSubject<Any>()
    
    struct Input {
        let notificationTapped: AnyObserver<Any>
    }
    
    //MARK: Output Private properties
    let categoriesBehavior: BehaviorRelay<CatsCellVM> = .init(value: .init(.init(image: "", title: "")))
    let offersBehavior: BehaviorRelay<OffersCellVM> = .init(value: .init(.init(image: "", liked: false, backgroundImage: "", name: "", location: "", rate: 3.5)))
    let mostPopularBehavior: BehaviorRelay<MostPopularCellVM> = .init(value: .init(.init(image: "", liked: false, backgroundImage: "", name: "", location: "", rate: 3.5)))
    
    let output: Output
    
    struct Output {
        let categoriesItems: Driver<CatsCellVM>
        let offersItems: Driver<OffersCellVM>
        let mostPopularItems: Driver<MostPopularCellVM>
    }
    
    init(router: WeakRouter<MainRoute>, useCase: MovieDetailsUseCase) {
        self.router = router
        self.useCase = useCase
        
        output = Output(categoriesItems: categoriesBehavior.asDriver(),
                        offersItems: offersBehavior.asDriver(),
                        mostPopularItems: mostPopularBehavior.asDriver())
        input = Input(notificationTapped: notificationSubject.asObserver())
        
        // Inputs
        notificationSubject
            .subscribe { _ in
                router.trigger(.profile)
            }
            .disposed(by: disposeBag)
    }
    
}
