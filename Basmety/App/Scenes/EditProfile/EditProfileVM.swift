//
//  EditProfileVM.swift
//  Basmety
//
//  Created by Mac on 31/08/2021.
//

import Foundation
import RxSwift
import RxCocoa
import XCoordinator

class EditProfileVM: ViewModel {
 
    // MARK: - Private properties
    private let disposeBag = DisposeBag()
    private let router: WeakRouter<MainRoute>
    private let useCase: MovieDetailsUseCase
    
    let input: Input
    
    //MARK: Input Private properties
    let itemSelectedSubject: PublishSubject<Int> = .init()
    
    struct Input {
        let itemSelected: AnyObserver<Int>
    }
    
    //MARK: Output Private properties
    let editProfileItemsBehavior: BehaviorRelay<[EditProfileCellVM]> = .init(value: [.init(.init(image: "person", firstTitle: "First name", secondTitle: "Bishoy")),
                                                                                     .init(.init(image: "person", firstTitle: "Last name", secondTitle: "Badie")),
                                                                                     .init(.init(image: "envelope.fill", firstTitle: "Email", secondTitle: "badeabishoy@gmail.com")),
                                                                                     .init(.init(image: "lock.fill", firstTitle: "Password", secondTitle: "**********")),])
    let output: Output
    
    struct Output {
        let editProfileItems: Driver<[EditProfileCellVM]>
    }
    
    init(router: WeakRouter<MainRoute>, useCase: MovieDetailsUseCase) {
        self.router = router
        self.useCase = useCase
        
        output = Output(editProfileItems: editProfileItemsBehavior.asDriver(onErrorJustReturn: []))
        input = Input(itemSelected: itemSelectedSubject.asObserver())
        
        //Inputs
        itemSelectedSubject.subscribe { [weak self] index in
            switch index.element {
            case 0: self?.router.trigger(.profile)
            case 1: self?.router.trigger(.profile)
            default: break
            }
        }
        .disposed(by: disposeBag)
    }
}
