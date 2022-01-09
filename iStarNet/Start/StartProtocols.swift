//
//  StartProtocols.swift
//  iSocialNet
//
//  Created by Miyo on 23/12/21.
//  
//

import Foundation
import UIKit

protocol StartViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: StartPresenterProtocol? { get set }
    
    func userIsLoggedIn()
    
}

protocol StartWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createStartModule() -> UIViewController
    func openSignUp(from view: StartViewProtocol?)
    func openLogin(from view: StartViewProtocol?)
    
    func goMain()
    
}

protocol StartPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: StartViewProtocol? { get set }
    var interactor: StartInteractorInputProtocol? { get set }
    var wireFrame: StartWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func openSignUp()
    func openLogin()
    func goMain()
}

protocol StartInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func isUserLoggedIn()
}

protocol StartInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: StartInteractorOutputProtocol? { get set }
    var localDatamanager: StartLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: StartRemoteDataManagerInputProtocol? { get set }
    
    func getCurrentUser()
    
}

protocol StartDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol StartRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: StartRemoteDataManagerOutputProtocol? { get set }
    var userService: UserServiceProtocol? { get set }
    
    func getCurrentUser()
    
}

protocol StartRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func isUserLoggedIn()
}

protocol StartLocalDataManagerOutputProtocol: AnyObject {
    // LOCALDATAMANAGER -> INTERACTOR
}

protocol StartLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: StartLocalDataManagerOutputProtocol? { get set }
}
