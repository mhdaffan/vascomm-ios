//
//  HomeServiceHeaderCell.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit
import SnapKit

final class HomeServiceHeaderCell: UITableViewCell {
    
    var cellModel: String? {
        didSet {
            updateUI()
        }
    }
    
    let titleLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.font = .gilroySemiBold(16)
        $0.textColor = .title
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        selectionStyle = .none
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
    }
    
    func updateUI() {
        guard let cellModel = cellModel else {
            return
        }
        titleLabel.text = cellModel
    }
    
}
