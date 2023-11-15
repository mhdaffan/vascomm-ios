//
//  UserModel.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

struct UserModel: Codable {
    let firstName: String?
    let lastName: String?
    let avatar: String?
    let id: Int
    let email: String
    
    var fullName: String {
        return "\(firstName ?? "") \(lastName ?? "")"
    }
    enum CodingKeys: String, CodingKey {
        case email, id, avatar
        case firstName = "first_name"
        case lastName = "last_name"
    }
    
}
