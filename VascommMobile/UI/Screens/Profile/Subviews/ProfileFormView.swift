//
//  ProfileFormView.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 16/11/23.
//

import UIKit
import SnapKit

final class ProfileFormView: UIView {
    
    private let cardView = ProfileCardView()
    private let headerView = ProfileFormHeaderView()
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
    private let infoLabel = UILabel().then {
        $0.text = "Pastikan profile anda terisi dengan benar, data pribadi anda terjamin keamanannya"
        $0.textColor = .disabled
        $0.font = .gilroyLight(12)
        $0.numberOfLines = 0
    }
    
    private(set) lazy var saveButton = UIButton().then {
        $0.primaryStyle(text: "Simpan Profile", icon: .icSave)
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(tapSaveButton), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        layer.cornerRadius = 20
        backgroundColor = .white
        addSubviews(cardView, stackView)
        cardView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        stackView.snp.makeConstraints {
            $0.top.equalTo(cardView.snp.bottom).offset(16)
            $0.bottom.equalToSuperview().inset(15)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        stackView.addArrangedSubviews(
            headerView,
            firstNameField,
            lastNameField,
            idField,
            emailField,
            phoneField,
            infoLabel,
            saveButton)
        saveButton.snp.makeConstraints {
            $0.height.equalTo(48)
        }
    }
    
    func updateUI(user: UserModel) {
        firstNameField.text = user.firstName ?? ""
        lastNameField.text = user.lastName ?? ""
        emailField.text = user.email
        cardView.updateUI(user: user)
    }
    
    @objc private func tapSaveButton() {
        
    }
    
}

