//
//  RegisterViewModel.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import RxSwift

final class RegisterViewModel: BaseViewModel {
    
    @Injected(\.authUseCase) var authUseCase: AuthUseCase
    
    let registerSuccessSubject = PublishSubject<Token>()
    
    func register(form: RegisterRequestModel) {
        loadingSubject.onNext(true)
        authUseCase.register(form: form)
            .subscribeOnMainThread(
                onNext: { [weak self] token in
                    self?.loadingSubject.onNext(false)
                    self?.registerSuccessSubject.onNext(token)
                }, onError: { [weak self] error in
                    self?.loadingSubject.onNext(false)
                    self?.errorSubject.onNext(error)
                })
            .disposed(by: disposeBag)
    }
    
    func validateRegisterForm(form: RegisterRequestModel) {
        if form.email.isEmpty {
            alertSubject.onNext("Email harus di isi")
        } else if form.password.isEmpty {
            alertSubject.onNext("Password harus di isi")
        } else if form.confirmPassword.isEmpty {
            alertSubject.onNext("Konfirmasi password harus di isi")
        } else if form.password != form.confirmPassword {
            alertSubject.onNext("Password anda tidak sama")
        } else {
            register(form: form)
        }
    }
}
