//
//  RepositoryInjectionKey.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 16/11/23.
//

struct AuthRepositoryInjectionKey: InjectionKey {
    static var currentValue: AuthRepository = AuthRepositoryImpl()
}

extension InjectedValue {
    
    var authRepository: AuthRepository {
        get { Self[AuthRepositoryInjectionKey.self] }
        set { Self[AuthRepositoryInjectionKey.self] = newValue }
    }
    
}
