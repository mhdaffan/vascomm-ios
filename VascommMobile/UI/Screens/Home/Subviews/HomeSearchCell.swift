//
//  HomeSearchCell.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit

final class HomeSearchCell: UITableViewCell {
    
    let imageContainerView = UIView().then {
        $0.backgroundColor = .white
        $0.addShadow(shadowColor: .gray, shadowOpacity: 0.2)
        $0.layer.cornerRadius = 20
    }
    let filterImageView = UIImageView(image: .icFilter)
    let searchTextField = TextField().then {
        $0.initSearchTextField()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        selectionStyle = .none
        imageContainerView.addSubview(filterImageView)
        filterImageView.snp.makeConstraints {
            $0.height.width.equalTo(20)
            $0.centerY.centerX.equalToSuperview()
        }
        
        contentView.addSubviews(imageContainerView, searchTextField)
        imageContainerView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.height.width.equalTo(40)
            $0.centerY.equalToSuperview()
        }
        searchTextField.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(20)
            $0.leading.equalTo(imageContainerView.snp.trailing).offset(30)
        }
    }
    
}

