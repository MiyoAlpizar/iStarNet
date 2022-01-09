//
//  LoginRemoteDataManager.swift
//  iSocialNet
//
//  Created by Miyo on 23/12/21.
//  
//

import Foundation

class LoginRemoteDataManager:LoginRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: LoginRemoteDataManagerOutputProtocol?
    var userService: UserServiceProtocol?
    
    func loginUser(email: String, pwd: String) {
        userService?.loginWithEmail(email: email, password: pwd, completion: { result in
            
            switch result {
            case .failure(let error):
                self.remoteRequestHandler?.onUserLoginError(error: error)
                print(error)
            case .success(let user):
                self.remoteRequestHandler?.onUserLogged(user: user)
                UserPersistence.shared.saveUser(user: user)
            }
            
        })
    }
}
