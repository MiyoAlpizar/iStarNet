//
//  NotificationsPresenter.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//  
//

import Foundation

class NotificationsPresenter  {
    
    // MARK: Properties
    weak var view: NotificationsViewProtocol?
    var interactor: NotificationsInteractorInputProtocol?
    var wireFrame: NotificationsWireFrameProtocol?
    
}

extension NotificationsPresenter: NotificationsPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.getNotifications()
    }
}

extension NotificationsPresenter: NotificationsInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func onNotificationsFetched(notifications: [NotificationTypeCell]) {
        view?.onNotificationsFetched(notifications: notifications)
    }
}
