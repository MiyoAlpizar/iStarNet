//
//  MessagesWireFrame.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//  
//

import Foundation
import UIKit

class MessagesWireFrame: MessagesWireFrameProtocol {

    class func createMessagesModule() -> UIViewController {
        
        let view = MessagesView.instance()
        
        let presenter: MessagesPresenterProtocol & MessagesInteractorOutputProtocol = MessagesPresenter()
        let interactor: MessagesInteractorInputProtocol & MessagesLocalDataManagerOutputProtocol & MessagesRemoteDataManagerOutputProtocol = MessagesInteractor()
        let localDataManager: MessagesLocalDataManagerInputProtocol = MessagesLocalDataManager()
        let remoteDataManager: MessagesRemoteDataManagerInputProtocol = MessagesRemoteDataManager()
        let wireFrame: MessagesWireFrameProtocol = MessagesWireFrame()
        
        view.navigationItem.title = "Mensajes"
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
