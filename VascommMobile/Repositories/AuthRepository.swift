//
//  AuthRepository.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 16/11/23.
//

import RxSwift

protocol AuthRepository {
    func login(email: String, password: String) -> Observable<Token>
    func register(form: RegisterRequestModel) -> Observable<Token>
}

struct AuthRepositoryImpl: AuthRepository {
    
    @Injected(\.dataTransferService) var service: DataTransferService
    
    func login(email: String, password: String) -> Observable<Token> {
        return service.request(with: AuthEndpoint.login(email: email, password: password))
    }
    
    func register(form: RegisterRequestModel) -> Observable<Token> {
        return service.request(with: AuthEndpoint.register(form: form))
    }
    
}
