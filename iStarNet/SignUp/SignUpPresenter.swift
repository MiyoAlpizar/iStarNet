//
//  SignUpPresenter.swift
//  iSocialNet
//
//  Created by Miyo on 23/12/21.
//  
//

import Foundation
import UIKit
class SignUpPresenter  {
    
    // MARK: Properties
    weak var view: SignUpViewProtocol?
    var interactor: SignUpInteractorInputProtocol?
    var wireFrame: SignUpWireFrameProtocol?
    
    func openImagePicker(type: UIImagePickerController.SourceType) {
        wireFrame?.openImagePicker(from: view!, type: type)
    }
}

extension SignUpPresenter: SignUpPresenterProtocol {
    func registerUser(email: String, pwd: String, imageProfile: UIImage) {
        view?.isLoading(loading: true)
        interactor?.registerUser(email: email, pwd: pwd, image: imageProfile)
    }
    
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension SignUpPresenter: SignUpInteractorOutputProtocol {
    
    func onRegisterUserError(error: String) {
        view?.onRegisterUserError(error: error)
        view?.isLoading(loading: false)
    }
    
    func onUserRegistered(user: iUser) {
        view?.onRegsiterUserSuccess()
        wireFrame?.goMain()
    }
    // TODO: implement interactor output methods
}
