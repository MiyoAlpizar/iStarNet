//
//  ProfileWireFrame.swift
//  iSocialNet
//
//  Created by Miyo on 26/12/21.
//  
//

import Foundation
import UIKit

class ProfileWireFrame: ProfileWireFrameProtocol {
    
    class func createProfileModule() -> UIViewController {
        
        let view = ProfileView.instance()
        
        let presenter: ProfilePresenterProtocol & ProfileInteractorOutputProtocol = ProfilePresenter()
        let interactor: ProfileInteractorInputProtocol & ProfileLocalDataManagerOutputProtocol & ProfileRemoteDataManagerOutputProtocol = ProfileInteractor()
        let localDataManager: ProfileLocalDataManagerInputProtocol = ProfileLocalDataManager()
        let remoteDataManager: ProfileRemoteDataManagerInputProtocol = ProfileRemoteDataManager()
        let wireFrame: ProfileWireFrameProtocol = ProfileWireFrame()
        
        view.presenter = presenter
        view.navigationItem.title = "Perfil"
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        interactor.userService = FirebaseUserService()
        remoteDataManager.remoteRequestHandler = interactor
        localDataManager.localRequestHandler = interactor
        
        return view
        
    }
    
    func goStart() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = StartWireFrame.createStartModule()
    }
    
}
