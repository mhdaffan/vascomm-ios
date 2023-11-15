//
//  ExtensionError.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 16/11/23.
//

import Foundation

extension Error {
    
    func generatedMessage() -> String {
        if let error = self as? DataTransferError {
            switch error {
            case .parsingJSON:
                return "Terjadi Kesalahan"
            case .errorModel(let errorModel):
                return errorModel.error
            case .networkFailure(let networkError):
                switch networkError {
                case .notConnected:
                    return "Koneksi Anda Terputus"
                default:
                    return "Terjadi Kesalahan"
                }
            }
        }
        
        return "Terjadi Kesalahan"
    }
}
