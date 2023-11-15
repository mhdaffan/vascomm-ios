//
//  MoreContentView.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit
import SnapKit

final class MoreContentView: UIView {
    
    var logoutHandler: (() -> Void)?
    var profileHandler: (() -> Void)?
    var settingHandler: (() -> Void)?
    
    private let avatarImageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill")).then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
    }
    private let nameLabel = UILabel().then {
        $0.textColor = .title
        $0.font = .gilroyExtraBold(14)
    }
    private let membershipLabel = UILabel().then {
        $0.text = "Membership BBLK"
        $0.textColor = .title
        $0.font = .proximaNovaSemiBold(11)
    }
    private(set) lazy var profileButton = UIButton().then {
        $0.contentHorizontalAlignment = .left
        $0.titleLabel?.font = .gilroySemiBold(12)
        $0.setTitle("Profile saya", for: .normal)
        $0.setTitleColor(.disabled, for: .normal)
        $0.addRightIcon(icon: .icChevronRight, size: 16)
        $0.tintColor = .disabled
        $0.addTarget(self, action: #selector(tapProfileButton), for: .touchUpInside)
    }
    private(set) lazy var settingButton = UIButton().then {
        $0.contentHorizontalAlignment = .left
        $0.titleLabel?.font = .gilroySemiBold(12)
        $0.setTitle("Pengaturan", for: .normal)
        $0.setTitleColor(.disabled, for: .normal)
        $0.addRightIcon(icon: .icChevronRight, size: 16)
        $0.tintColor = .disabled
        $0.addTarget(self, action: #selector(tapSettingButton), for: .touchUpInside)
    }
    private(set) lazy var logoutButton = UIButton().then {
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 16
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .proximaNovaRegular(12)
        $0.setTitle("Logout", for: .normal)
        $0.addTarget(self, action: #selector(tapLogoutButton), for: .touchUpInside)
    }
    private let followUsStackView = UIStackView().then {
        $0.spacing = 8
        $0.alignment = .center
        $0.distribution = .fillProportionally
        $0.axis = .horizontal
    }
    private let followUsLabel = UILabel().then {
        $0.text = "Ikuti kami di"
        $0.textColor = .title
        $0.font = .gilroyLight(16)
    }
    private let facebookImageView = UIImageView(image: .icFacebook)
    private let instagramImageView = UIImageView(image: .icInstagram)
    private let twitterImageView = UIImageView(image: .icTwitter)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .white
        addSubviews(avatarImageView, nameLabel, membershipLabel, profileButton, settingButton, logoutButton, followUsStackView)
        avatarImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(60)
            $0.leading.equalToSuperview().inset(32)
            $0.width.height.equalTo(40)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(avatarImageView).inset(2)
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(32)
        }
        membershipLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(nameLabel)
        }
        profileButton.snp.makeConstraints {
            $0.top.equalTo(avatarImageView.snp.bottom).offset(24)
            $0.leading.equalTo(avatarImageView)
            $0.width.equalTo(145)
        }
        settingButton.snp.makeConstraints {
            $0.top.equalTo(profileButton.snp.bottom).offset(16)
            $0.leading.equalTo(avatarImageView)
            $0.width.equalTo(145)
        }
        logoutButton.snp.makeConstraints {
            $0.top.equalTo(settingButton.snp.bottom).offset(32)
            $0.leading.equalTo(avatarImageView)
            $0.width.equalTo(132)
            $0.height.equalTo(28)
        }
        followUsStackView.snp.makeConstraints {
            $0.top.equalTo(logoutButton.snp.bottom).offset(80)
            $0.centerX.bottom.equalToSuperview()
        }
        followUsStackView.addArrangedSubviews(
            followUsLabel,
            facebookImageView,
            instagramImageView,
            twitterImageView)
        facebookImageView.snp.makeConstraints {
            $0.width.height.equalTo(14)
        }
        instagramImageView.snp.makeConstraints {
            $0.width.height.equalTo(14)
        }
        twitterImageView.snp.makeConstraints {
            $0.width.height.equalTo(14)
        }
    }
    
    func updateUI(user: UserModel) {
        nameLabel.text = user.fullName
        if let avatar = user.avatar, !avatar.isEmpty {
            avatarImageView.setImageURL(urlString: avatar)
        }
    }
    
    @objc private func tapLogoutButton() {
        logoutHandler?()
    }
    
    @objc private func tapProfileButton() {
        profileHandler?()
    }
    
    @objc private func tapSettingButton() {
        settingHandler?()
    }
    
}
