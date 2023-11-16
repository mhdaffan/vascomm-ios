//
//  ProfileFormHeaderView.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 16/11/23.
//

import UIKit

final class ProfileFormHeaderView: UIView {
    
    private let titleLabel = UILabel().then {
        $0.textAlignment = .center
        $0.text = "Pilih data yang ingin ditampilkan"
        $0.textColor = .title
        $0.font = .gilroyLight(16)
    }
    private let subtitleLabel = UILabel().then {
        $0.text = "Data Diri"
        $0.textColor = .black
        $0.font = .gilroyLight(14)
    }
    private let noteLabel = UILabel().then {
        $0.text = "Data diri anda sesuai KTP"
        $0.textColor = .disabled
        $0.font = .gilroyLight(10)
    }
    private let userView = UIView().then {
        $0.backgroundColor = .secondary
        $0.layer.cornerRadius = 18
    }
    private let userPinImageView = UIImageView(image: .icUserPin)
    private let pinView = UIView().then {
        $0.backgroundColor = .n30
        $0.layer.cornerRadius = 18
    }
    private let mapImageView = UIImageView(image: .icMap)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        userView.addSubview(userPinImageView)
        userPinImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(20)
        }
        pinView.addSubview(mapImageView)
        mapImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(14)
            $0.height.equalTo(16)
        }
        addSubviews(titleLabel, subtitleLabel, noteLabel, userView, pinView)
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        userView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.leading.bottom.equalToSuperview()
            $0.width.height.equalTo(36)
        }
        pinView.snp.makeConstraints {
            $0.top.equalTo(userView)
            $0.leading.equalTo(noteLabel.snp.trailing).offset(4)
            $0.width.height.equalTo(36)
        }
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(userView)
            $0.leading.equalTo(userView.snp.trailing).offset(4)
        }
        noteLabel.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(2)
            $0.leading.trailing.equalTo(subtitleLabel)
        }
    }
    
}

