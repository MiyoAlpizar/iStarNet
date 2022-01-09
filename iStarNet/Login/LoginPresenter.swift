//
//  LoginPresenter.swift
//  iSocialNet
//
//  Created by Miyo on 23/12/21.
//  
//

import Foundation

class LoginPresenter  {
    
    // MARK: Properties
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    var wireFrame: LoginWireFrameProtocol?
    
}

extension LoginPresenter: LoginPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        
    }
    
    func loginUser(email: String, pwd: String) {
        interactor?.loginUser(email: email, pwd: pwd)
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func onUserLogged(user: iUser) {
        view?.onUserLogged(user: user)
        wireFrame?.goMain()
    }
    
    func onUserLoginError(error: Error) {
        view?.onUserLoginError(error: error)
    }
}
