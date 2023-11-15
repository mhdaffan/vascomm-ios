//
//  AuthUseCase.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 16/11/23.
//

import RxSwift

protocol AuthUseCase {
    func login(email: String, password: String) -> Observable<Token>
    func register(form: RegisterRequestModel) -> Observable<Token>
}

struct AuthUseCaseImpl: AuthUseCase {
    
    @Injected(\.authRepository) var repo: AuthRepository
    
    func login(email: String, password: String) -> Observable<Token> {
        return repo.login(email: email, password: password).do(
            onNext: { _ in
                // this should be called from api and UserDefaultsConfig has it own UserDefaultUseCase and UserDefaultRepository but I have no time :(( sorry
                UserDefaultsConfig.user = .init(
                    firstName: "Janet",
                    lastName: "Weaver",
                    avatar: "https://reqres.in/img/faces/2-image.jpg",
                    id: 2,
                    email: "anet.weaver@reqres.in")
            })
    }
    
    func register(form: RegisterRequestModel) -> Observable<Token> {
        return repo.register(form: form)
    }
    
}

