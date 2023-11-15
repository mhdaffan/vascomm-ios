//
//  LoginView.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit
import SnapKit

final class LoginView: UIView {
    
    var loginHandler: ((String, String) -> Void)?
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 32
    }
    private let emailField = TextField().then {
        $0.placeholder = "Masukkan email anda"
        $0.title = "Email"
    }
    private let passwordField = TextField().then {
        $0.rightView = $0.secureTextButton
        $0.placeholder = "Masukkan password anda"
        $0.title = "Password"
        $0.isSecureTextEntry = true
        $0.configureRightButton(text: "Lupa Password anda ?")
    }
    private(set) lazy var loginButton = UIButton().then {
        $0.primaryStyle(text: "Login", icon: .icArrowRight)
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(tapLoginButton), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        stackView.addArrangedSubviews(emailField, passwordField, loginButton)
        loginButton.snp.makeConstraints {
            $0.height.equalTo(48)
        }
    }
    
    @objc private func tapLoginButton() {
        loginHandler?(emailField.text, passwordField.text)
    }
    
}
