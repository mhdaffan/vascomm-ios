//
//  LoginViewModel.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import RxSwift

final class LoginViewModel: BaseViewModel {
    
    @Injected(\.authUseCase) var authUseCase: AuthUseCase
    
    let loginSuccessSubject = PublishSubject<Token>()
    
    func login(email: String, password: String) {
        loadingSubject.onNext(true)
        authUseCase.login(email: email, password: password)
            .subscribeOnMainThread(
                onNext: { [weak self] token in
                    self?.loadingSubject.onNext(false)
                    self?.loginSuccessSubject.onNext(token)
                }, onError: { [weak self] error in
                    self?.loadingSubject.onNext(false)
                    self?.errorSubject.onNext(error)
                })
            .disposed(by: disposeBag)
    }
    
}
