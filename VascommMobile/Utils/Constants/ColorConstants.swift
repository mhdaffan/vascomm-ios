//
//  ColorConstants.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit

extension UIColor {
    
    static let primary = UIColor(hex: "#1D334F")
    static let simple = UIColor(hex: "#597393")
    static let title = UIColor(hex: "#002060")
    static let disabled = UIColor(hex: "#BEBEBE")
    static let secondary = UIColor(hex: "#00D9D5")
    static let n30 = UIColor(hex: "#EBEDF7")
}

extension UIColor {
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let hexString: String = (hex as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString as String)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}
