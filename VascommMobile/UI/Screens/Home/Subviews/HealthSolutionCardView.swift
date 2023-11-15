//
//  HealthSolutionCardView.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit
import SnapKit

final class HealthSolutionCardView: UIView {
    
    private let cardView = UIView().then {
        $0.backgroundColor = .white
        $0.addShadow(shadowColor: .gray, shadowOpacity: 0.2)
        $0.layer.cornerRadius = 16
    }
    private let imageView = UIImageView(image: .bgHealth)
    private let titleLabel = UILabel().then {
        $0.font = .gilroyExtraBold(18)
        $0.text = "Solusi, Kesehatan Anda"
        $0.textColor = .primary
        $0.numberOfLines = 0
    }
    private let subtitleLabel = UILabel().then {
        $0.font = .gilroyLight(12)
        $0.text = "Update informasi seputar kesehatan semua bisa disini !"
        $0.textColor = .primary
        $0.numberOfLines = 0
    }
    private let ctaButton = UIButton().then {
        $0.primaryStyle(text: "   Selengkapnya   ", icon: nil, textSize: 12)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        clipsToBounds = false
        cardView.clipsToBounds = false
        addSubview(cardView)
        cardView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        cardView.addSubviews(imageView, titleLabel, subtitleLabel, ctaButton)
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-20)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(131)
            $0.height.equalTo(130)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.equalTo(imageView.snp.leading).inset(8)
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
