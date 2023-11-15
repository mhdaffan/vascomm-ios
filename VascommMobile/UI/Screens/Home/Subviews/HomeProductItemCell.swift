//
//  HomeProductItemCell.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit
import SnapKit

final class HomeProductItemCell: UICollectionViewCell {
    
    var cellModel: HomeProductModel? {
        didSet {
            updateUI()
        }
    }
    
    let containerView = UIView().then {
        $0.backgroundColor = .white
        $0.addShadow(shadowColor: .gray, shadowOpacity: 0.2)
        $0.layer.cornerRadius = 16
    }
    let starImageView = UIImageView(image: .icStar)
    let ratingLabel = UILabel().then {
        $0.font = .proximaNovaSemiBold(16)
        $0.textColor = .disabled
    }
    let productNameLabel = UILabel().then {
        $0.font = .proximaNovaSemiBold(14)
        $0.textColor = .black
    }
    let priceLabel = UILabel().then {
        $0.font = .proximaNovaSemiBold(12)
        $0.textColor = .orange1
    }
    let productImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
        containerView.addSubviews(starImageView, ratingLabel, productImageView, productNameLabel, priceLabel)
        starImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalTo(ratingLabel.snp.leading).inset(-4)
            $0.width.height.equalTo(20)
        }
        ratingLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(10)
        }
        productImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(25)
            $0.width.height.equalTo(80)
        }
        productNameLabel.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(productNameLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
    
    func updateUI() {
        guard let cellModel = cellModel else {
            return
        }
        productImageView.image = cellModel.image
        ratingLabel.text = String(cellModel.rating)
        productNameLabel.text = cellModel.name
        priceLabel.text = "Rp \(cellModel.price)"
    }
    
}
