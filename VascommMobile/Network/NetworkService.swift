//
//  NetworkService.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 16/11/23.
//

import Foundation

enum NetworkError: Error {
    case notConnected
    case urlGeneration
}

extension NetworkError {
    
    func networkErrorMessage() -> String {
        switch self {
        case .notConnected:
            return "No internet connection"
        case .urlGeneration:
            return "Source not found"
        }
    }
    
}

protocol NetworkService {
    @discardableResult
    func request(endpoint: Requestable, completion: @escaping (Result<(Data?, HTTPURLResponse?), NetworkError>) -> Void) -> URLSessionDataTask?
}

class NetworkServiceImpl: NetworkService {
    
    @Injected(\.networkConfiguration) var config: NetworkConfigurable
    
    func request(endpoint: Requestable, completion: @escaping (Result<(Data?, HTTPURLResponse?), NetworkError>) -> Void) -> URLSessionDataTask? {
        do {
            let urlRequest = try endpoint.urlRequest(with: config)
            let sessionDataTask = URLSession.shared.loadData(from: urlRequest) { (data, response, requestError) in
                DispatchQueue.main.async {
                    let response = (response as? HTTPURLResponse)
                    if let requestError = requestError, requestError._code == NSURLErrorNotConnectedToInternet {
                        completion(.failure(.notConnected))
                    } else {
                        completion(.success((data, response)))
                    }
                }
            }
            sessionDataTask.resume()
            return sessionDataTask
        } catch {
            DispatchQueue.main.async {
                completion(.failure(NetworkError.urlGeneration))
            }
            return nil
        }
    }
    
}
