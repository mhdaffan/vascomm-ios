//
//  RegisterViewController.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit
import SnapKit

final class RegisterViewController: ViewController {
    
    private let viewModel: RegisterViewModel
    private let scrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let stackView = UIStackView().then {
        $0.spacing = 16
        $0.axis = .vertical
    }
    private let headerView = WelcomeHeaderView()
    private let registerView = RegisterView()
    private let footerView = WelcomeFooterView().then {
        $0.updateUI(title: "Sudah punya akun ?", cta: "Login sekarang")
    }
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        observeClosures()
        observeViewModel()
    }
    
    override func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo, let keyboardRect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        scrollView.snp.updateConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(keyboardRect.height)
        }
    }
    
    override func keyboardWillHidden(notification: Notification) {
        scrollView.snp.updateConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(0)
        }
    }
    
    private func configureUI() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(0)
        }
        scrollView.addSubviews(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(self.view)
        }
        stackView.addArrangedSubviews(headerView, registerView, footerView)
    }
    
    private func observeClosures() {
        registerView.registerHandler = { [weak self] register in
            
        }
        footerView.actionHandler = { [weak self] in
            self?.moveTo(.replaceLogin)
        }
    }
    
    private func observeViewModel() {
        
    }
    
}

extension RegisterViewController {
    
    static func build() -> RegisterViewController {
        let viewModel = RegisterViewModel()
        let viewController = RegisterViewController(viewModel: viewModel)
        
        return viewController
    }
    
}
