//
//  NotificationsInteractor.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//  
//

import Foundation

class NotificationsInteractor: NotificationsInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: NotificationsInteractorOutputProtocol?
    var localDatamanager: NotificationsLocalDataManagerInputProtocol?
    var remoteDatamanager: NotificationsRemoteDataManagerInputProtocol?
    
    func getNotifications() {
        remoteDatamanager?.getNotifications()
    }

}
extension NotificationsInteractor: NotificationsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func onNotificationsFetched(notifications: [NotificationTypeCell]) {
        presenter?.onNotificationsFetched(notifications: notifications)
    }
}

extension NotificationsInteractor: NotificationsLocalDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
