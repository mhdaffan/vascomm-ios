//
//  RegisterView.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit
import SnapKit

final class RegisterView: UIView {
    
    var registerHandler: ((RegisterRequestModel) -> Void)?
    
    private let horizontalStackView = UIStackView().then {
        $0.distribution = .fillEqually
        $0.axis = .horizontal
        $0.spacing = 32
    }
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 32
    }
    private let firstNameField = TextField().then {
        $0.placeholder = "Nama Depan"
        $0.title = "Nama Depan"
    }
    private let lastNameField = TextField().then {
        $0.placeholder = "Nama Belakang"
        $0.title = "Nama Belakang"
    }
    private let idField = TextField().then {
        $0.placeholder = "Masukkan No. KTP anda"
        $0.title = "No. KTP"
    }
    private let emailField = TextField().then {
        $0.placeholder = "Masukkan email anda"
        $0.title = "Email"
    }
    private let phoneField = TextField().then {
        $0.placeholder = "Masukkan no. telpon anda"
        $0.title = "No. Telpon"
    }
    private let passwordField = TextField().then {
        $0.placeholder = "Masukkan password anda"
        $0.title = "Password"
        $0.isSecureTextEntry = true
    }
    private let confirmPasswordField = TextField().then {
        $0.placeholder = "Konfirmasi password anda"
        $0.title = "Konfirmasi Password"
        $0.isSecureTextEntry = true
    }
    private(set) lazy var registerButton = UIButton().then {
        $0.primaryStyle(text: "Register", icon: .icArrowRight)
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(tapRegisterButton), for: .touchUpInside)
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
        horizontalStackView.addArrangedSubviews(firstNameField, lastNameField)
        stackView.addArrangedSubviews(
            horizontalStackView,
            idField,
            emailField,
            phoneField,
            passwordField,
            confirmPasswordField,
            registerButton)
        registerButton.snp.makeConstraints {
            $0.height.equalTo(48)
        }
    }
    
    func resetForm() {
        firstNameField.text = ""
        lastNameField.text = ""
        idField.text = ""
        emailField.text = ""
        phoneField.text = ""
        passwordField.text = ""
        confirmPasswordField.text = ""
    }
    
    @objc private func tapRegisterButton() {
        registerHandler?(RegisterRequestModel(
            firstName: firstNameField.text,
            lastName: lastNameField.text,
            idNumber: idField.text,
            phoneNumber: phoneField.text,
            email: emailField.text,
            password: passwordField.text,
            confirmPassword: confirmPasswordField.text)
        )
    }
    
}

