//
//  MainTabWireFrame.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//  
//

import Foundation
import UIKit

class MainTabWireFrame: MainTabWireFrameProtocol {

    class func createMainTabModule() -> UIViewController {
        
        let view = MainTabView.instance()
        
        let presenter: MainTabPresenterProtocol & MainTabInteractorOutputProtocol = MainTabPresenter()
        let interactor: MainTabInteractorInputProtocol & MainTabLocalDataManagerOutputProtocol & MainTabRemoteDataManagerOutputProtocol = MainTabInteractor()
        let localDataManager: MainTabLocalDataManagerInputProtocol = MainTabLocalDataManager()
        let remoteDataManager: MainTabRemoteDataManagerInputProtocol = MainTabRemoteDataManager()
        let wireFrame: MainTabWireFrameProtocol = MainTabWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        localDataManager.localRequestHandler = interactor
        
        return view
        
    }
    
}
