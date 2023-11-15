//
//  FontConstants.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit

extension UIFont {
    
    private static func getFont(name: String, size: Double) -> UIFont {
        if let font = UIFont(name: name, size: CGFloat(size)) {
            return font
        }
        
        return UIFont.systemFont(ofSize: CGFloat(size))
    }
    
    static func gilroyLight(_ size: Double) -> UIFont {
        return getFont(name: "Gilroy-Light", size: size)
    }
    
    static func gilroySemiBold(_ size: Double) -> UIFont {
        return getFont(name: "Gilroy-SemiBold", size: size)
    }
    
    static func gilroyExtraBold(_ size: Double) -> UIFont {
        return getFont(name: "Gilroy-ExtraBold", size: size)
    }
    
    static func proximaNovaSemiBold(_ size: Double) -> UIFont {
        return getFont(name: "Proxima-Nova-Semibold", size: size)
    }
    
    static func proximaNovaRegular(_ size: Double) -> UIFont {
        return getFont(name: "Proxima-Nova-Regular", size: size)
    }
    
}
