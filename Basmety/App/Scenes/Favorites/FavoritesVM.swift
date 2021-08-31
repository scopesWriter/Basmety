//
//  FavoritesVM.swift
//  Basmety
//
//  Created by Mac on 29/08/2021.
//

import Foundation
import RxSwift
import RxCocoa
import XCoordinator

class FavoritesVM: ViewModel {
    
    // MARK: - Private properties
    private let disposeBag = DisposeBag()
    private let router: WeakRouter<MainRoute>
    private let useCase: MovieDetailsUseCase
    
    let input: Input
    
    //MARK: Input Private properties
    
    struct Input {
        
    }
    
    //MARK: Output Private properties
    
    let output: Output
    
    struct Output {
        
    }
    
    init(router: WeakRouter<MainRoute>, useCase: MovieDetailsUseCase) {
        self.router = router
        self.useCase = useCase
        
        output = Output()
        input = Input()
    }
    
}

