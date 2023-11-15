//
//  BaseViewModel.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import RxSwift

class BaseViewModel {
    
    let disposeBag = DisposeBag()
    let errorSubject = PublishSubject<Error>()
    let refreshDataSubject = PublishSubject<Void>()
    let alertSubject = PublishSubject<String>()
    let loadingSubject = PublishSubject<Bool>()
    
}
