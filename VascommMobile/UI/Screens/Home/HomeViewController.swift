//
//  HomeViewController.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit
import SnapKit

final class HomeViewController: ViewController {
    
    private lazy var tableView = UITableView().then {
        $0.contentInset = .init(top: 24, left: 0, bottom: 0, right: 0)
        $0.delegate = self
        $0.dataSource = self
        $0.register(HomeCardCell.self, forCellReuseIdentifier: "HomeCardCell")
        $0.register(HomeSearchCell.self, forCellReuseIdentifier: "HomeSearchCell")
        $0.register(HomeProductListCell.self, forCellReuseIdentifier: "HomeProductListCell")
        $0.register(HomeServiceItemCell.self, forCellReuseIdentifier: "HomeServiceItemCell")
        $0.register(HomeServiceHeaderCell.self, forCellReuseIdentifier: "HomeServiceHeaderCell")
        $0.backgroundColor = .white
        $0.rowHeight = UITableView.automaticDimension
        $0.separatorStyle = .none
    }
    
    let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.extractHomeService()
        configureUI()
    }
    
    override func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo, let keyboardRect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        tableView.snp.updateConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(keyboardRect.height)
        }
    }
    
    override func keyboardWillHidden(notification: Notification) {
        tableView.snp.updateConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(0)
        }
    }
    
    private func configureUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(0)
        }
        addCartItemBarButton()
        addNotificationItemBarButton()
        addLeftBarButtonItem(image: .icDashMenu, action: #selector(tapMoreMenuButton))
    }
    
    @objc private func tapMoreMenuButton() {
        
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch viewModel.data[indexPath.row] {
        case .card, .search, .serviceHeader, .product:
            break
        case .service(let data):
            print(data.name)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.data[indexPath.row] {
        case .card:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCardCell") as! HomeCardCell
            return cell
        case .search:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSearchCell") as! HomeSearchCell
            return cell
        case .product(let data):
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeProductListCell") as! HomeProductListCell
            cell.cellModel = data
            cell.didSelectProduct = { product in
                print(product.name)
            }
            return cell
        case .serviceHeader(let title):
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeServiceHeaderCell") as! HomeServiceHeaderCell
            cell.cellModel = title
            
            return cell
        case .service(let data):
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeServiceItemCell") as! HomeServiceItemCell
            cell.cellModel = data
            
            return cell
        }
    }
    
}

extension HomeViewController {
    
    static func build() -> HomeViewController {
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(viewModel: viewModel)
        
        return viewController
    }
    
}
