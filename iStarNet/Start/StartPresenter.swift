//
//  StartPresenter.swift
//  iSocialNet
//
//  Created by Miyo on 23/12/21.
//  
//

import Foundation

class StartPresenter  {
    
    // MARK: Properties
    weak var view: StartViewProtocol?
    var interactor: StartInteractorInputProtocol?
    var wireFrame: StartWireFrameProtocol?
    
}

extension StartPresenter: StartPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.getCurrentUser()
    }
    
    func openSignUp() {
        wireFrame?.openSignUp(from: view)
    }
    
    func openLogin() {
        wireFrame?.openLogin(from: view)
    }
    
    func goMain() {
        wireFrame?.goMain()
    }
}

extension StartPresenter: StartInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func isUserLoggedIn() {
        view?.userIsLoggedIn()
    }
}
