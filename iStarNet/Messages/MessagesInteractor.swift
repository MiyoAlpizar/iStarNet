//
//  MessagesInteractor.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//  
//

import Foundation

class MessagesInteractor: MessagesInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: MessagesInteractorOutputProtocol?
    var localDatamanager: MessagesLocalDataManagerInputProtocol?
    var remoteDatamanager: MessagesRemoteDataManagerInputProtocol?

    func getMessages() {
        remoteDatamanager?.getMessages()
    }
    
}
extension MessagesInteractor: MessagesRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func onMessagesFetched(messages: [MessageForCell]) {
        presenter?.onMessagesFetched(messages: messages)
    }
}

extension MessagesInteractor: MessagesLocalDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
