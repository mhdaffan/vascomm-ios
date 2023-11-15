//
//  AuthEndpoint.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 16/11/23.
//

struct AuthEndpoint {
    
    static func register(form: RegisterRequestModel) -> DataEndpoint<Token> {
        var body: [String: Any] = [
            "email": form.email,
            "password": form.password
        ]
        if let firstName = form.firstName {
            body["first_name"] = firstName
        }
        if let lastName = form.lastName {
            body["last_name"] = lastName
        }
        if let phone = form.phoneNumber {
            body["phone"] = phone
        }
        return DataEndpoint(
            path: "api/register",
            method: .post,
            bodyParamaters: body
        )
    }
}
