//
//  HomeProductListModel.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit

struct HomeProductListModel {
    var products: [HomeProductModel]
    
    static func dummyData() -> HomeProductListModel {
        return .init(products: [
            .init(rating: 5, image: .bgMachine, name: "Suntik Steril", price: 10000),
            .init(rating: 4, image: .bgMachine, name: "Microwave", price: 1200000),
            .init(rating: 5, image: .bgMachine, name: "Rice Cooker", price: 800000),
            .init(rating: 5, image: .bgMachine, name: "Vacum Cleaner", price: 16000000),
            .init(rating: 5, image: .bgMachine, name: "Dispenser", price: 560000)
        ])
    }
}

struct HomeProductModel {
    let rating: Int
    let image: UIImage?
    let name: String
    let price: Double
}

