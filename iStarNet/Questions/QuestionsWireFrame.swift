//
//  QuestionsWireFrame.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//  
//

import Foundation
import UIKit

class QuestionsWireFrame: QuestionsWireFrameProtocol {

    class func createQuestionsModule() -> UIViewController {
        
        let view = QuestionsView.instance()
        
        let presenter: QuestionsPresenterProtocol & QuestionsInteractorOutputProtocol = QuestionsPresenter()
        let interactor: QuestionsInteractorInputProtocol & QuestionsLocalDataManagerOutputProtocol & QuestionsRemoteDataManagerOutputProtocol = QuestionsInteractor()
        let localDataManager: QuestionsLocalDataManagerInputProtocol = QuestionsLocalDataManager()
        let remoteDataManager: QuestionsRemoteDataManagerInputProtocol = QuestionsRemoteDataManager()
        let wireFrame: QuestionsWireFrameProtocol = QuestionsWireFrame()
        
        view.navigationItem.title = "Encuestas"
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
