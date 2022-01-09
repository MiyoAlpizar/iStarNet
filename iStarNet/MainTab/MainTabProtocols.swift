//
//  MainTabProtocols.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//  
//

import Foundation
import UIKit

protocol MainTabViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: MainTabPresenterProtocol? { get set }
}

protocol MainTabWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createMainTabModule() -> UIViewController
}

protocol MainTabPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: MainTabViewProtocol? { get set }
    var interactor: MainTabInteractorInputProtocol? { get set }
    var wireFrame: MainTabWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol MainTabInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol MainTabInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: MainTabInteractorOutputProtocol? { get set }
    var localDatamanager: MainTabLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MainTabRemoteDataManagerInputProtocol? { get set }
}

protocol MainTabDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol MainTabRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: MainTabRemoteDataManagerOutputProtocol? { get set }
}

protocol MainTabRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol MainTabLocalDataManagerOutputProtocol: AnyObject {
    // LOCALDATAMANAGER -> INTERACTOR
}

protocol MainTabLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: MainTabLocalDataManagerOutputProtocol? { get set }
}
