//
//  NotificationVM.swift
//  Basmety
//
//  Created by Mac on 01/09/2021.
//

import Foundation
import RxCocoa
import RxSwift
import XCoordinator

class NotificationVM: ViewModel {
    
    // MARK: - Private properties
    private let disposeBag = DisposeBag()
    private let router: WeakRouter<MainRoute>
    private let useCase: MovieDetailsUseCase
    
    let input: Input
    
    //MARK: Input Private properties
    
    
    struct Input {
        
    }
    
    //MARK: Output Private properties
    let notificationItemsSubject: BehaviorRelay<[NotificationCellVM]> = .init(value: [.init(.init(image: "Mask Group 14", firstTitle: "Engagement hairstyle", secondTitle: "Viola Salon", thirdTitle: " Abu Dhabiless", date: "Aug 4 , 2021")),
                                                                                      .init(.init(image: "Mask Group 14", firstTitle: "Engagement hairstyle", secondTitle: "Viola Salon", thirdTitle: " Abu Dhabiless", date: "Aug 4 , 2021")),
                                                                                      .init(.init(image: "Mask Group 14", firstTitle: "Engagement hairstyle", secondTitle: "Viola Salon", thirdTitle: " Abu Dhabiless", date: "Aug 4 , 2021"))])
                                                                                   
    let output: Output
    
    struct Output {
        let notifcaitionItems: Driver<[NotificationCellVM]>
    }
    
    init(router: WeakRouter<MainRoute>, useCase: MovieDetailsUseCase) {
        self.router = router
        self.useCase = useCase
        
        output = Output(notifcaitionItems: notificationItemsSubject.asDriver(onErrorJustReturn: []))
        input = Input()
        
    }
    
}
