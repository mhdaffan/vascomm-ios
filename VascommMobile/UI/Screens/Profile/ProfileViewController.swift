//
//  ProfileViewController.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 16/11/23.
//

import UIKit
import SnapKit

final class ProfileViewController: ViewController {
    
    private let scrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let contentView = UIView()
    private let formView = ProfileFormView()
    private let viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        addCartItemBarButton()
        addNotificationItemBarButton()
        view.addSubview(scrollView)
        view.backgroundColor = .lightGray
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(self.view)
        }
        contentView.addSubviews(formView)
        formView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview().inset(24)
        }
        formView.updateUI(user: .init(firstName: "Janet", lastName: "Weaver", avatar: "https://reqres.in/img/faces/2-image.jpg", id: 2, email: "anet.weaver@reqres.in"))
    }
    
}

extension ProfileViewController {
    
    static func build() -> ProfileViewController {
        let viewModel = ProfileViewModel()
        let viewController = ProfileViewController(viewModel: viewModel)
        
        return viewController
    }
    
}
