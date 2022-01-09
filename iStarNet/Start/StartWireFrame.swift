//
//  StartWireFrame.swift
//  iSocialNet
//
//  Created by Miyo on 23/12/21.
//  
//

import Foundation
import UIKit

class StartWireFrame: StartWireFrameProtocol {
    
    class func createStartModule() -> UIViewController {
        
        let view = StartView.instance()
        
        let presenter: StartPresenterProtocol & StartInteractorOutputProtocol = StartPresenter()
        let interactor: StartInteractorInputProtocol & StartLocalDataManagerOutputProtocol & StartRemoteDataManagerOutputProtocol = StartInteractor()
        let localDataManager: StartLocalDataManagerInputProtocol = StartLocalDataManager()
        let remoteDataManager: StartRemoteDataManagerInputProtocol = StartRemoteDataManager()
        let wireFrame: StartWireFrameProtocol = StartWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        localDataManager.localRequestHandler = interactor
        remoteDataManager.userService = FirebaseUserService()
        
        return view
        
    }
    
    func openSignUp(from view: StartViewProtocol?) {
        guard let view = view as? UIViewController else { return }
        let nc = UINavigationController(rootViewController: SignUpWireFrame.createSignUpModule())
        nc.modalPresentationStyle = .fullScreen
        view.present(nc, animated: true, completion: nil)
    }
    
    func openLogin(from view: StartViewProtocol?) {
        guard let view = view as? UIViewController else { return }
        let nc = UINavigationController(rootViewController: LoginWireFrame.createLoginModule())
        nc.modalPresentationStyle = .fullScreen
        view.present(nc, animated: true, completion: nil)
    }
    
    func goMain() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = MainTabWireFrame.createMainTabModule()
    }
    
}
