//
//  StartRemoteDataManager.swift
//  iSocialNet
//
//  Created by Miyo on 23/12/21.
//  
//

import Foundation

class StartRemoteDataManager:StartRemoteDataManagerInputProtocol {
    var userService: UserServiceProtocol?
    var remoteRequestHandler: StartRemoteDataManagerOutputProtocol?
    
    func getCurrentUser() {
        if let isLoggedIn = userService?.isLoggedIn()
        {
            if isLoggedIn {
                remoteRequestHandler?.isUserLoggedIn()
                userService?.getCurrentUser(completion: { result in
                    switch result {
                    case .success(let user):
                        UserPersistence.shared.saveUser(user: user)
                    case .failure(let error):
                        print(error)
                    }
                })
            }
        }
    }
}
