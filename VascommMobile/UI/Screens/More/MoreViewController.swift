//
//  MoreViewController.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit
import SnapKit

final class MoreViewController: ViewController {
    
    private(set) lazy var closeButton = UIButton().then {
        $0.addTarget(self, action: #selector(tapCloseButton), for: .touchUpInside)
        $0.setImage(.icCloseCircleFill, for: .normal)
    }
    private let scrollView = UIScrollView().then {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let contentView = MoreContentView()
    private let viewModel: MoreViewModel
    
    init(viewModel: MoreViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        handleClosures()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.updateUser()
        updateUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .title.withAlphaComponent(0.8)
        view.addSubviews(closeButton, scrollView)
        closeButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().inset(24)
            $0.width.height.equalTo(24)
        }
        scrollView.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.leading.equalTo(closeButton.snp.trailing).offset(8)
        }
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(50)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func updateUI() {
        if let user = viewModel.user {
            contentView.updateUI(user: user)
        }
    }
    
    private func handleClosures() {
        contentView.logoutHandler = { [weak self] in
            self?.viewModel.logout()
            self?.moveTo(.relaunchLogin)
        }
        contentView.profileHandler = { [weak self] in
            
        }
        contentView.settingHandler = { [weak self] in
            
        }
    }
    
    @objc private func tapCloseButton() {
        self.dismiss(animated: true)
    }
    
}

extension MoreViewController {
    
    static func build() -> MoreViewController {
        let viewModel = MoreViewModel()
        let viewController = MoreViewController(viewModel: viewModel)
        
        return viewController
    }
    
}
