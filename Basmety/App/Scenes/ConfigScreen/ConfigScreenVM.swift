//
//  ConfigScreenVM.swift
//  Basmety
//
//  Created by OSX on 17/08/2021.
//

import Foundation
import RxSwift
import RxCocoa
import XCoordinator

class ConfigScreenVM: ViewModel {
    
    /// Outputs
    struct Output {
        
    }
    
    //MARK: Private input properties
    private let getStartedClicked: PublishSubject<Bool> = .init()
    
    /// Inputs
    struct Input {
        let getStartedTapped: AnyObserver<Bool>
    }
    
    let output: Output
    let input: Input
    
    //MARK: private stored properties
    var router: WeakRouter<AppRoute>
    var useCase: MovieDetailsUseCase
    let disposeBag = DisposeBag()
    
    init(router: WeakRouter<AppRoute>, useCase: MovieDetailsUseCase) {
        self.router = router
        self.useCase = useCase
        
        output = Output()
        input = Input(getStartedTapped: getStartedClicked.asObserver())
        
        
        // Inputs
        getStartedClicked
            .subscribe { _ in
                router.trigger(.onBoard)
            }
            .disposed(by: disposeBag)
    }
    
    
}
