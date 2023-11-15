//
//  HomeCardCell.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit
import SnapKit

final class HomeCardCell: UITableViewCell {
    
    private let stackView = UIStackView().then {
        $0.spacing = 40
        $0.axis = .vertical
    }
    private let healthSolutionCardView = HealthSolutionCardView()
    private let specialServiceCardView = SpecialServiceCardView()
    private let trackCardView = TrackCardView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        selectionStyle = .none
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.leading.trailing.equalToSuperview()
        }
        stackView.addArrangedSubviews(
            healthSolutionCardView,
            specialServiceCardView,
            trackCardView)
    }
    
}
