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
        
        output = Output()
        input = Input()
    }
    
}
