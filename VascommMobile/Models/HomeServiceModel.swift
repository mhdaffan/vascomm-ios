//
//  HomeServiceModel.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit

struct HomeServiceModel {
    let image: UIImage?
    let name: String
    let price: Double
    let place: String
    let location: String
}

struct HomeServiceList {
    let title: String
    let data: [HomeServiceModel]
    
    static func dummyData() -> HomeServiceList {
        return .init(
            title: "Pilih Tipe Layanan Kesehatan Anda",
            data: [
                .init(
                    image: .bgLocation,
                    name: "PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja",
                    price: 1400000,
                    place: "Lenmarc Surabaya",
                    location: "Dukuh Pakis, Surabaya"),
                .init(
                    image: .bgLocation2,
                    name: "PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja",
                    price: 1400000,
                    place: "Lenmarc Surabaya",
                    location: "Dukuh Pakis, Surabaya"),
                .init(
                    image: .bgLocation2,
                    name: "PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja",
                    price: 1400000,
                    place: "Lenmarc Surabaya",
                    location: "Dukuh Pakis, Surabaya"),
                .init(
                    image: .bgLocation,
                    name: "PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja",
                    price: 1400000,
                    place: "Lenmarc Surabaya",
                    location: "Dukuh Pakis, Surabaya")
            ])
    }
    
    func toHomeCellTypeList() -> [HomeCellType] {
        var data: [HomeCellType] = [.serviceHeader(self.title)]
        data.append(contentsOf: self.data.map { item -> HomeCellType in
            return .service(item)
        })
        
        return data
    }
}
