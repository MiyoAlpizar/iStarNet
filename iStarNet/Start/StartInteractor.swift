//
//  StartInteractor.swift
//  iSocialNet
//
//  Created by Miyo on 23/12/21.
//  
//

import Foundation

class StartInteractor: StartInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: StartInteractorOutputProtocol?
    var localDatamanager: StartLocalDataManagerInputProtocol?
    var remoteDatamanager: StartRemoteDataManagerInputProtocol?
    var userService: UserServiceProtocol? 
    
    func getCurrentUser() {
        remoteDatamanager?.getCurrentUser()
    }
}
extension StartInteractor: StartRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    
    
    func isUserLoggedIn() {
        presenter?.isUserLoggedIn()
    }
}

extension StartInteractor: StartLocalDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
