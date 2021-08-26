//
//  OnBoardVM.swift
//  Basmety
//
//  Created by OSX on 17/08/2021.
//

import Foundation
import RxSwift
import RxCocoa
import XCoordinator

class OnBoardVM: ViewModel {
    
    // MARK: - Private properties
    private let disposeBag = DisposeBag()
    private let router: WeakRouter<AppRoute>
    private let useCase: MovieDetailsUseCase
    
    
    let input: Input
    
    //MARK: Input Private properties
    private let asGuestClicked: PublishSubject<Bool> = .init()
    
    struct Input {
        let asGuestTapped: AnyObserver<Bool>
    }
    
    //MARK: Output Private properties
    private let wizardItemsSubject: BehaviorSubject<[WizardCellVM]> = .init(value: [.init(.init(image: "OnBoard", title: "Nearest", desc: "Easily Find Salons and SPAs Nearby")),
                                                                            .init(.init(image: "OnBoard", title: "Nearest", desc: "Easily Find Salons and SPAs Nearby")),
                                                                            .init(.init(image: "OnBoard", title: "Nearest", desc: "Easily Find Salons and SPAs Nearby"))])
//    private let wizardCount: PublishSubject<Int> = .init()
    
    
    let output: Output
    
    struct Output {
        let wizardItems: Driver<[WizardCellVM]>
        
//        let wizardCounter: PublishSubject<Int>
    }
    
    init(router: WeakRouter<AppRoute>, useCase: MovieDetailsUseCase) {
        self.router = router
        self.useCase = useCase
        
        output = Output(wizardItems: wizardItemsSubject.asDriver(onErrorJustReturn: []))
//        wizardCount.onNext()

        
        input = Input(asGuestTapped: asGuestClicked.asObserver())
        
        //inputs
        asGuestClicked.subscribe { [weak self] _ in
            guard let self = self else { return }
            self.router.trigger(.Login)
        }
        .disposed(by: disposeBag)
    }
    
}
