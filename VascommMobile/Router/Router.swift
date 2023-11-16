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
    case relaunchHome
    case relaunchLogin
    case moreMenu
    case profile
}

extension UIViewController {
    
    func moveTo(_ screen: ScreenName) {
        switch screen {
        case .replaceRegister:
            navigationController?.replace(to: RegisterViewController.build())
        case .replaceLogin:
            navigationController?.replace(to: LoginViewController.build())
        case .relaunchHome:
            let nvc = UINavigationController(rootViewController: HomeViewController.build())
            UIWindow.key?.set(rootViewController: nvc)
        case .relaunchLogin:
            let nvc = UINavigationController(rootViewController: LoginViewController.build())
            UIWindow.key?.set(rootViewController: nvc)
        case .moreMenu:
            let nvc = UINavigationController(rootViewController: MoreViewController.build())
            nvc.modalPresentationStyle = .custom
            present(nvc, animated: true)
        case .profile:
            navigationController?.pushViewController(ProfileViewController.build(), animated: true)
        }
    }
    
}
