//
//  SignUpInteractor.swift
//  iSocialNet
//
//  Created by Miyo on 23/12/21.
//  
//

import Foundation
import UIKit

class SignUpInteractor: SignUpInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: SignUpInteractorOutputProtocol?
    var localDatamanager: SignUpLocalDataManagerInputProtocol?
    var remoteDatamanager: SignUpRemoteDataManagerInputProtocol?
    
    func registerUser(email: String, pwd: String, image: UIImage) {
        remoteDatamanager?.registerUser(email: email, pwd: pwd, image: image)
    }
}
extension SignUpInteractor: SignUpRemoteDataManagerOutputProtocol {
    func onError(error: String) {
        presenter?.onRegisterUserError(error: error)
    }
    
    // TODO: Implement use case methods
    func onUserRegistered(user: iUser) {
        presenter?.onUserRegistered(user: user)
    }
}

extension SignUpInteractor: SignUpLocalDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
