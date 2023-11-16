//
//  ProfileCardView.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 16/11/23.
//

import UIKit

final class ProfileCardView: UIView {
    
    private let avatarImageView = UIImageView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
    }
    private let nameLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .gilroyExtraBold(18)
    }
    private let membershipLabel = UILabel().then {
        $0.text = "Membership BBLK"
        $0.textColor = .white
        $0.font = .gilroyLight(14)
    }
    private let infoLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.text = "Lengkapi profile anda untuk memaksimalkan penggunaan aplikasi"
        $0.textColor = .white
        $0.font = .gilroyLight(12)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .title
        layer.cornerRadius = 20
        addSubviews(avatarImageView, nameLabel, membershipLabel, infoLabel)
        avatarImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().inset(24)
            $0.width.height.equalTo(40)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(avatarImageView)
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(32)
        }
        membershipLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(nameLabel)
        }
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(membershipLabel.snp.bottom).offset(34)
            $0.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }
    
    func updateUI(user: UserModel) {
        nameLabel.text = user.fullName
        avatarImageView.setImageURL(urlString: user.avatar ?? "")
    }
    
}

