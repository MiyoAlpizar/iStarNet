//
//  LoginInteractor.swift
//  iSocialNet
//
//  Created by Miyo on 23/12/21.
//  
//

import Foundation

class LoginInteractor: LoginInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: LoginInteractorOutputProtocol?
    var localDatamanager: LoginLocalDataManagerInputProtocol?
    var remoteDatamanager: LoginRemoteDataManagerInputProtocol?
    
    func loginUser(email: String, pwd: String) {
        remoteDatamanager?.loginUser(email: email, pwd: pwd)
    }

}
extension LoginInteractor: LoginRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func onUserLogged(user: iUser) {
        presenter?.onUserLogged(user: user)
    }
    
    func onUserLoginError(error: Error) {
        presenter?.onUserLoginError(error: error)
    }
}

extension LoginInteractor: LoginLocalDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
