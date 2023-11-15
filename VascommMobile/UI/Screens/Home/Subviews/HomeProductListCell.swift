//
//  HomeProductListCell.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit
import SnapKit

class HomeProductListCell: UITableViewCell {
    
    var didSelectProduct: ((HomeProductModel) -> Void)?
    
    var cellModel: HomeProductListModel? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    private lazy var flowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
    }
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).then {
        $0.delegate = self
        $0.dataSource = self
        $0.register(HomeProductItemCell.self, forCellWithReuseIdentifier: "HomeProductItemCell")
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
        $0.alwaysBounceVertical = false
        $0.alwaysBounceHorizontal = true
        $0.contentInset = .init(top: 0, left: 8, bottom: 0, right: 8)
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
        contentView.addSubviews(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(220)
        }
    }
    
}

extension HomeProductListCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let product = cellModel?.products[indexPath.row] else {
            return
        }
        didSelectProduct?(product)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModel?.products.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeProductItemCell", for: indexPath) as?  HomeProductItemCell, let cellModel = cellModel else {
            return UICollectionViewCell()
        }
        cell.cellModel = cellModel.products[indexPath.row]
        return cell
    }
    
}

extension HomeProductListCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 176, height: 192)
    }
    
}
