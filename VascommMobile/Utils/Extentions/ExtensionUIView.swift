//
//  ExtensionUIView.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    func removeSubviews() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }
    
    func addShadow(shadowColor: UIColor = .gray, shadowOffset: CGSize = CGSize(width: 0, height: 16), shadowOpacity: Float = 0.3, shadowRadius: CGFloat = 5, shouldRasterize: Bool = false) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.cornerRadius = 4
        if shouldRasterize {
            layer.shouldRasterize = true
            layer.rasterizationScale = UIScreen.main.scale
        }
    }
    
    func getSizeRatio(targetWidth: CGFloat, width: CGFloat, height: CGFloat) -> CGSize {
        let ratio: CGFloat = width / height
        let newHeight = targetWidth / ratio
        
        return CGSize(width: targetWidth, height: newHeight)
    }
    
}
