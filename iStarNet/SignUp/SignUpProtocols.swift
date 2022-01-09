//
//  SignUpProtocols.swift
//  iSocialNet
//
//  Created by Miyo on 23/12/21.
//  
//

import Foundation
import UIKit

protocol SignUpViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: SignUpPresenterProtocol? { get set }
    func canRegisterChanged(canRegister: Bool)
    func isLoading(loading: Bool)
    func onRegisterUserError(error: String)
    func onRegsiterUserSuccess()
}

protocol SignUpWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createSignUpModule() -> UIViewController
    
    func openImagePicker(from view: SignUpViewProtocol, type: UIImagePickerController.SourceType)
    
    func goMain()
}

protocol SignUpPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: SignUpViewProtocol? { get set }
    var interactor: SignUpInteractorInputProtocol? { get set }
    var wireFrame: SignUpWireFrameProtocol? { get set }
    
    func viewDidLoad()
    
    func openImagePicker(type: UIImagePickerController.SourceType)
    
    func registerUser(email: String, pwd: String, imageProfile: UIImage)
    
}

protocol SignUpInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func onUserRegistered(user: iUser)
    func onRegisterUserError(error: String)
}

protocol SignUpInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: SignUpInteractorOutputProtocol? { get set }
    var localDatamanager: SignUpLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: SignUpRemoteDataManagerInputProtocol? { get set }
    
    func registerUser(email: String, pwd: String, image: UIImage)
}

protocol SignUpDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol SignUpRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: SignUpRemoteDataManagerOutputProtocol? { get set }
    var userService: UserServiceProtocol? { get set }
    var storageService: StorageServiceProtocol? { get set }
    var firestoreService: FirestoreService? { get set }
    
    func registerUser(email: String, pwd: String, image: UIImage)
    
}

protocol SignUpRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onUserRegistered(user: iUser)
    func onError(error: String)
}

protocol SignUpLocalDataManagerOutputProtocol: AnyObject {
    // LOCALDATAMANAGER -> INTERACTOR
}

protocol SignUpLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: SignUpLocalDataManagerOutputProtocol? { get set }
}
