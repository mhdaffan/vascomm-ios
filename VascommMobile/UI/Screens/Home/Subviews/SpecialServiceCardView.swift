//
//  SpecialServiceCardView.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit
import SnapKit

final class SpecialServiceCardView: UIView {
    
    private let cardView = UIView().then {
        $0.backgroundColor = .white
        $0.addShadow(shadowColor: .gray, shadowOpacity: 0.2)
        $0.layer.cornerRadius = 16
    }
    private let imageView = UIImageView(image: .bgVaccine)
    private let titleLabel = UILabel().then {
        $0.font = .gilroyExtraBold(18)
        $0.text = "Layanan Khusus"
        $0.textColor = .primary
        $0.numberOfLines = 0
    }
    private let subtitleLabel = UILabel().then {
        $0.font = .gilroyLight(12)
        $0.text = "Tes Covid 19, Cegah Corona Sedini Mungkin"
        $0.textColor = .primary
        $0.numberOfLines = 0
    }
    private let ctaButton = UIButton().then {
        $0.secondaryStyle(text: "Daftar Test", icon: nil, textSize: 12)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(cardView)
        cardView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        cardView.addSubviews(imageView, titleLabel, subtitleLabel, ctaButton)
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-20)
            $0.trailing.equalToSuperview().inset(8)
            $0.width.equalTo(120)
            $0.height.equalTo(120)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.equalTo(imageView.snp.leading).inset(-8)
        }
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(titleLabel)
        }
        ctaButton.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(titleLabel)
            $0.bottom.equalToSuperview().inset(8)
            $0.height.equalTo(32)
        }
    }
    
}
