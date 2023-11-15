//
//  LoginViewController.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit
import SnapKit

final class LoginViewController: ViewController {
    
    private let viewModel: LoginViewModel
    private let scrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let stackView = UIStackView().then {
        $0.spacing = 16
        $0.axis = .vertical
    }
    private let headerView = WelcomeHeaderView()
    private let loginView = LoginView()
    private let footerView = WelcomeFooterView().then {
        $0.updateUI(title: "Belum punya akun ?", cta: "Daftar sekarang")
    }
    
    init(viewModel: LoginViewModel) {
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
        stackView.addArrangedSubviews(headerView, loginView, footerView)
    }
    
    private func observeClosures() {
        loginView.loginHandler = { [weak self] email, password in
            self?.viewModel.login(email: email, password: password)
        }
        footerView.actionHandler = { [weak self] in
            self?.moveTo(.replaceRegister)
        }
    }
    
    private func observeViewModel() {
        disposeBag.insert(
            viewModel.errorSubject.subscribeOnMainThread(
                onNext: { [weak self] error in
                    self?.showErrorAlert(message: error.generatedMessage())
                }),
            viewModel.alertSubject.subscribeOnMainThread(
                onNext: { [weak self] message in
                    self?.showErrorAlert(message: message)
                }),
            viewModel.loginSuccessSubject.subscribeOnMainThread(
                onNext: { [weak self] token in
                    self?.moveTo(.relaunchHome)
                }),
            viewModel.loadingSubject.subscribeOnMainThread(
                onNext: { [weak self] show in
                    if show {
                        self?.showLoadingIndicator()
                    } else {
                        self?.hideLoadingIndicator()
                    }
                })
        )
    }
    
}

extension LoginViewController {
    
    static func build() -> LoginViewController {
        let viewModel = LoginViewModel()
        let viewController = LoginViewController(viewModel: viewModel)
        
        return viewController
    }
    
}
