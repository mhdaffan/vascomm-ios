//
//  DataTransferService.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 16/11/23.
//

import Foundation
import RxSwift

enum DataTransferError: Error {
    case parsingJSON(statusCode: Int)
    case errorModel(ErrorModel)
    case networkFailure(NetworkError)
}

final class DataEndpoint<T: Any>: Endpoint {}

protocol DataTransferService {
    func request<T: Decodable>(with endpoint: DataEndpoint<T>) -> Observable<T>
}

class DataTransferServiceImpl: DataTransferService {
    
    @Injected(\.networkService) var networkService: NetworkService
    
    func request<T: Decodable>(with endpoint: DataEndpoint<T>) -> Observable<T> {
        Observable.create { [weak self] observer in
            self?.networkService.request(endpoint: endpoint) { result in
                switch result {
                case let .success((responseData, response)):
                    let statusCode = response?.statusCode ?? -1
                    guard let responseData = responseData else {
                        return observer.onError(DataTransferError.parsingJSON(statusCode: statusCode))
                    }
                    do {
                        let result = try JSONDecoder().decode(T.self, from: responseData)
                        return observer.onNext(result)
                    } catch {
                        do {
                            let result = try JSONDecoder().decode(ErrorModel.self, from: responseData)
                            return observer.onError(DataTransferError.errorModel(result))
                        } catch {
                            return observer.onError(DataTransferError.parsingJSON(statusCode: statusCode))
                        }
                    }
                case .failure(let error):
                    return observer.onError(DataTransferError.networkFailure(error))
                }
            }
            return Disposables.create()
        }
        
    }
    
}
