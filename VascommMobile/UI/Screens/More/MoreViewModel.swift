//
//  MoreViewModel.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

final class MoreViewModel: BaseViewModel {
    
    var user: UserModel?
    
    func updateUser() {
        // this should be called from UserDefaultUseCase and UserDefaultRepository but I have no time :(( sorry
        self.user = UserDefaultsConfig.user
    }
    
    func logout() {
        // this should be called from api and UserDefaultsConfig has it own UserDefaultUseCase and UserDefaultRepository but I have no time :(( sorry
        UserDefaultsConfig.user = nil
    }
    
}
