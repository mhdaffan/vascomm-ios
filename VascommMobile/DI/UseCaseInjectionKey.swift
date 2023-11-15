//
//  UseCaseInjectionKey.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 16/11/23.
//

struct AuthUseCaseInjectionKey: InjectionKey {
    static var currentValue: AuthUseCase = AuthUseCaseImpl()
}

extension InjectedValue {
    
    var authUseCase: AuthUseCase {
        get { Self[AuthUseCaseInjectionKey.self] }
        set { Self[AuthUseCaseInjectionKey.self] = newValue }
    }
    
}
