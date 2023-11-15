//
//  ExtensionUIButton.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit
import SnapKit

extension UIButton {
    
    func primaryStyle(text: String, icon: UIImage?, textSize: Double = 16) {
        backgroundColor = .title
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .gilroyLight(textSize)
        setTitle(text, for: .normal)
        layer.cornerRadius = 8
        if let icon = icon {
            addRightIcon(icon: icon)
        }
    }
    
    func secondaryStyle(text: String, icon: UIImage? = nil, textSize: Double = 16) {
        backgroundColor = .white
        setTitleColor(.title, for: .normal)
        titleLabel?.font = .gilroyLight(textSize)
        setTitle(text, for: .normal)
        if let icon = icon {
            addRightIcon(icon: icon)
        }
    }
    
    func addRightIcon(icon: UIImage?, size: CGFloat = 24) {
        let imageView = UIImageView(image: icon)
        addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(24)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(size)
        }
    }
    
}
