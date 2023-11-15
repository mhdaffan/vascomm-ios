//
//  HomeServiceItemCell.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit
import SnapKit

final class HomeServiceItemCell: UITableViewCell {
    
    var cellModel: HomeServiceModel? {
        didSet {
            updateUI()
        }
    }
    
    let containerView = UIView().then {
        $0.backgroundColor = .white
        $0.addShadow(shadowColor: .gray, shadowOpacity: 0.2)
        $0.layer.cornerRadius = 16
    }
    let serviceNameLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.font = .proximaNovaSemiBold(14)
        $0.textColor = .title
    }
    let priceLabel = UILabel().then {
        $0.font = .proximaNovaSemiBold(12)
        $0.textColor = .orange1
    }
    let servicePlaceLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.font = .proximaNovaSemiBold(14)
        $0.textColor = .gray
    }
    let serviceLocationLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.font = .proximaNovaRegular(12)
        $0.textColor = .disabled
    }
    let productImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        selectionStyle = .none
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
        containerView.addSubviews(productImageView, serviceNameLabel, priceLabel, servicePlaceLabel, serviceLocationLabel)
        productImageView.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.width.equalTo(119)
            $0.height.equalTo(149)
        }
        serviceNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalTo(productImageView.snp.leading).inset(-20)
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(serviceNameLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(serviceNameLabel)
        }
        servicePlaceLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(serviceNameLabel)
        }
        serviceLocationLabel.snp.makeConstraints {
            $0.top.equalTo(servicePlaceLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(serviceNameLabel)
        }
    }
    
    func updateUI() {
        guard let cellModel = cellModel else {
            return
        }
        productImageView.image = cellModel.image
        serviceLocationLabel.text = cellModel.location
        servicePlaceLabel.text = cellModel.place
        serviceNameLabel.text = cellModel.name
        priceLabel.text = "Rp \(cellModel.price)"
    }
    
}
