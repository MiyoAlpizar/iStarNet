//
//  NotificationsWireFrame.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//  
//

import Foundation
import UIKit

class NotificationsWireFrame: NotificationsWireFrameProtocol {

    class func createNotificationsModule() -> UIViewController {
        
        let view = NotificationsView.instance()
        
        let presenter: NotificationsPresenterProtocol & NotificationsInteractorOutputProtocol = NotificationsPresenter()
        let interactor: NotificationsInteractorInputProtocol & NotificationsLocalDataManagerOutputProtocol & NotificationsRemoteDataManagerOutputProtocol = NotificationsInteractor()
        let localDataManager: NotificationsLocalDataManagerInputProtocol = NotificationsLocalDataManager()
        let remoteDataManager: NotificationsRemoteDataManagerInputProtocol = NotificationsRemoteDataManager()
        let wireFrame: NotificationsWireFrameProtocol = NotificationsWireFrame()
        
        view.presenter = presenter
        view.navigationItem.title = "Notificaciones"
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
