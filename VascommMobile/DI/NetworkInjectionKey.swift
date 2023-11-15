//
//  NetworkInjectionKey.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 16/11/23.
//

import Foundation

struct NetworkServiceInjectionKey: InjectionKey {
    static var currentValue: NetworkService = NetworkServiceImpl()
}

struct DataTransferServiceInjectionKey: InjectionKey {
    static var currentValue: DataTransferService = DataTransferServiceImpl()
}

struct NetworkConfigurationInjectionKey: InjectionKey {
    static var currentValue: NetworkConfigurable = NetworkConfiguration(
        baseURL: URL(string: "https://reqres.in")!,
        headers: [
            "Content-Type": "application/json"
        ]
    )
}

extension InjectedValue {
    
    var networkConfiguration: NetworkConfigurable {
        get { Self[NetworkConfigurationInjectionKey.self] }
        set { Self[NetworkConfigurationInjectionKey.self] = newValue }
    }
    
    var networkService: NetworkService {
        get { Self[NetworkServiceInjectionKey.self] }
        set { Self[NetworkServiceInjectionKey.self] = newValue }
    }
    
    var dataTransferService: DataTransferService {
        get { Self[DataTransferServiceInjectionKey.self] }
        set { Self[DataTransferServiceInjectionKey.self] = newValue }
    }
    
}
