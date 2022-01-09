//
//  MessagesProtocols.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//  
//

import Foundation
import UIKit

protocol MessagesViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: MessagesPresenterProtocol? { get set }
    
    func onMessagesFetched(messages: [MessageForCell])
    
}

protocol MessagesWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createMessagesModule() -> UIViewController
}

protocol MessagesPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: MessagesViewProtocol? { get set }
    var interactor: MessagesInteractorInputProtocol? { get set }
    var wireFrame: MessagesWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol MessagesInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func onMessagesFetched(messages: [MessageForCell])
}

protocol MessagesInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: MessagesInteractorOutputProtocol? { get set }
    var localDatamanager: MessagesLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MessagesRemoteDataManagerInputProtocol? { get set }
    
    func getMessages()
}

protocol MessagesDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol MessagesRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: MessagesRemoteDataManagerOutputProtocol? { get set }
    
    func getMessages()
}

protocol MessagesRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onMessagesFetched(messages: [MessageForCell])
}

protocol MessagesLocalDataManagerOutputProtocol: AnyObject {
    // LOCALDATAMANAGER -> INTERACTOR
}

protocol MessagesLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: MessagesLocalDataManagerOutputProtocol? { get set }
}
