//
//  Router.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit

enum ScreenName {
    case replaceRegister
    case replaceLogin
}

extension UIViewController {
    
    func moveTo(_ screen: ScreenName) {
        switch screen {
        case .replaceRegister:
            navigationController?.replace(to: RegisterViewController.build())
        case .replaceLogin:
            navigationController?.replace(to: LoginViewController.build())
        }
    }
    
}
