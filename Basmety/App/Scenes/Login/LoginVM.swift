//
//  LoginVM.swift
//  Basmety
//
//  Created by OSX on 17/08/2021.
//

import Foundation
import RxSwift
import RxCocoa
import XCoordinator

class LoginVM: ViewModel {
    
    // MARK: - Private properties
    private let disposeBag = DisposeBag()
    private let router: WeakRouter<AppRoute>
    private let useCase: MovieDetailsUseCase
    
    
    let input: Input
    
    //MARK: Input Private properties
    
    struct Input {
        
    }
    
    //MARK: Output Private properties
    
    let output: Output
    
    struct Output {
        
    }
    
    
    init(router: WeakRouter<AppRoute>, useCase: MovieDetailsUseCase) {
        self.router = router
        self.useCase = useCase
        
        input = Input()
        
        output = Output()
    }
    
}

