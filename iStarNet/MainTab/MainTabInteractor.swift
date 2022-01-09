//
//  MainTabInteractor.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//  
//

import Foundation

class MainTabInteractor: MainTabInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: MainTabInteractorOutputProtocol?
    var localDatamanager: MainTabLocalDataManagerInputProtocol?
    var remoteDatamanager: MainTabRemoteDataManagerInputProtocol?

}
extension MainTabInteractor: MainTabRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}

extension MainTabInteractor: MainTabLocalDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
