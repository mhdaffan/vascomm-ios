//
//  HomeViewModel.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

final class HomeViewModel: BaseViewModel {
    
    var data: [HomeCellType] = [
        .card,
        .search,
        .product(HomeProductListModel.dummyData())
    ]
    
    func extractHomeService() {
        let homeService = HomeServiceList.dummyData()
        data.append(contentsOf: homeService.toHomeCellTypeList())
    }
    
}

enum HomeCellType {
    case card
    case search
    case product(HomeProductListModel)
    case serviceHeader(String)
    case service(HomeServiceModel)
}
