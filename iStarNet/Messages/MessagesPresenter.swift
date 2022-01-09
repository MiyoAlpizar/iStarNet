//
//  MessagesPresenter.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//  
//

import Foundation

class MessagesPresenter  {
    
    // MARK: Properties
    weak var view: MessagesViewProtocol?
    var interactor: MessagesInteractorInputProtocol?
    var wireFrame: MessagesWireFrameProtocol?
    
}

extension MessagesPresenter: MessagesPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.getMessages()
    }
}

extension MessagesPresenter: MessagesInteractorOutputProtocol {
    // TODO: implement interactor output methods
    
    func onMessagesFetched(messages: [MessageForCell]) {
        view?.onMessagesFetched(messages: messages)
    }
    
}
