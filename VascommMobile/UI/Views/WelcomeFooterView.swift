//
//  WelcomeFooterView.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit
import SnapKit

final class WelcomeFooterView: UIView {
    
    var actionHandler: (() -> Void)?
    
    private let containerView = UIView()
    private let titleLabel = UILabel().then {
        $0.textAlignment = .right
        $0.font = .proximaNovaRegular(14)
        $0.textColor = .disabled
    }
    private(set) lazy var actionButton = UIButton().then {
        $0.addTarget(self, action: #selector(tapActionButton), for: .touchUpInside)
        $0.setTitleColor(.title, for: .normal)
        $0.titleLabel?.font = .proximaNovaRegular(14)
    }
    private(set) lazy var copyRightButton = UIButton().then {
        $0.setTitle("  SILK. all right reserved.", for: .normal)
        $0.setImage(.icCCircleOutline, for: .normal)
        $0.setTitleColor(.disabled, for: .normal)
        $0.titleLabel?.font = .proximaNovaRegular(14)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubviews(titleLabel, actionButton, copyRightButton)
        titleLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.trailing.equalTo(self.snp.centerX)
        }
        actionButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(4)
        }
        copyRightButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(48)
            $0.centerX.bottom.equalToSuperview()
        }
    }
    
    func updateUI(title: String, cta: String) {
        titleLabel.text = title
        actionButton.setTitle(cta, for: .normal)
    }
    
    @objc private func tapActionButton() {
        actionHandler?()
    }
    
}
