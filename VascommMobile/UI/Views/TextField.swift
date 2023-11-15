//
//  TextField.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit
import SnapKit

final class TextField: UIView {
    
    private let titleLabel = UILabel().then {
        $0.textColor = .title
        $0.font = .gilroySemiBold(16)
    }
    private let textField = UITextField().then {
        $0.addShadow()
        $0.borderStyle = .roundedRect
        $0.layer.cornerRadius = 8
        $0.textColor = .title
        $0.font = .proximaNovaSemiBold(12)
    }
    private(set) lazy var rightButton = UIButton().then {
        $0.contentHorizontalAlignment = .right
        $0.titleLabel?.textAlignment = .right
        $0.setTitleColor(.simple, for: .normal)
        $0.titleLabel?.font = .gilroySemiBold(14)
        $0.addTarget(self, action: #selector(tapRightButton), for: .touchUpInside)
    }
    lazy var secureTextButton = UIButton().then {
        $0.setTitle("  ", for: .normal)
        $0.setImage(.icEyeOn?.resize(to: .init(width: 16, height: 16)), for: .normal)
        $0.addTarget(self, action: #selector(tapSecureTextButton), for: .touchUpInside)
    }
    
    weak var delegate: UITextFieldDelegate?
    var rightButtonHandler: (() -> Void)?
    
    var text: String {
        get { textField.text ?? "" }
        set { textField.text = newValue}
    }
    
    var placeholder: String? {
        didSet {
            textField.attributedPlaceholder = NSAttributedString(
                string: placeholder ?? "",
                attributes: [.foregroundColor: UIColor.gray, .font: UIFont.proximaNovaRegular(12)])
        }
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var isSecureTextEntry: Bool = false {
        didSet {
            let image: UIImage? = isSecureTextEntry ? .icEyeOff : .icEyeOn
            secureTextButton.setImage(image?.resize(to: .init(width: 16, height: 16)), for: .normal)
            textField.isSecureTextEntry = isSecureTextEntry
        }
    }
    
    var rightView: UIView? {
        didSet {
            textField.rightView = rightView
            textField.rightViewMode = .always
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubviews(titleLabel, textField)
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        textField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(40)
        }
    }
    
    func configureRightButton(text: String) {
        rightButton.setTitle(text, for: .normal)
        guard rightButton.superview == nil else {
            return
        }
        
        addSubview(rightButton)
        rightButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview()
        }
        titleLabel.snp.remakeConstraints {
            $0.top.leading.equalToSuperview()
            $0.trailing.equalTo(rightButton.snp.leading).inset(-8)
        }
    }
    
    @objc private func tapSecureTextButton() {
        isSecureTextEntry = !isSecureTextEntry
    }
    
    @objc private func tapRightButton() {
        rightButtonHandler?()
    }
    
}
