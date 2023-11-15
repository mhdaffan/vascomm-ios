//
//  WelcomeHeaderView.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit
import SnapKit

final class WelcomeHeaderView: UIView {
    
    private let titleLabel = UILabel().then {
        $0.font = .gilroyExtraBold(28)
        $0.text = "Hai, Selamat Datang"
        $0.textColor = .primary
        $0.numberOfLines = 0
    }
    private let subtitleLabel = UILabel().then {
        $0.font = .proximaNovaSemiBold(12)
        $0.text = "Silahkan login untuk melanjutkan"
        $0.textColor = .primary
        $0.numberOfLines = 0
    }
    private let imageView = UIImageView(image: .bgWelcome)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubviews(titleLabel, subtitleLabel, imageView)
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(24)
        }
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        imageView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(4)
            $0.trailing.bottom.equalToSuperview()
            $0.width.equalTo(331)
            $0.height.equalTo(218)
        }
    }
    
}
