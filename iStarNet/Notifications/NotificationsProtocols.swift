//
//  NotificationsProtocols.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//  
//

import Foundation
import UIKit

protocol NotificationsViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: NotificationsPresenterProtocol? { get set }
    
    func onNotificationsFetched(notifications: [NotificationTypeCell])
}

protocol NotificationsWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createNotificationsModule() -> UIViewController
}

protocol NotificationsPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: NotificationsViewProtocol? { get set }
    var interactor: NotificationsInteractorInputProtocol? { get set }
    var wireFrame: NotificationsWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol NotificationsInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func onNotificationsFetched(notifications: [NotificationTypeCell])
}

protocol NotificationsInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: NotificationsInteractorOutputProtocol? { get set }
    var localDatamanager: NotificationsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: NotificationsRemoteDataManagerInputProtocol? { get set }
    
    func getNotifications()
}

protocol NotificationsDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol NotificationsRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: NotificationsRemoteDataManagerOutputProtocol? { get set }
    
    func getNotifications()
    
}

protocol NotificationsRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onNotificationsFetched(notifications: [NotificationTypeCell])
}

protocol NotificationsLocalDataManagerOutputProtocol: AnyObject {
    // LOCALDATAMANAGER -> INTERACTOR
}

protocol NotificationsLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: NotificationsLocalDataManagerOutputProtocol? { get set }
}
