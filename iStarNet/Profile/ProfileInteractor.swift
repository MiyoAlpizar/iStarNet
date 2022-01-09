//
//  ProfileInteractor.swift
//  iSocialNet
//
//  Created by Miyo on 26/12/21.
//  
//

import Foundation

class ProfileInteractor: ProfileInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: ProfileInteractorOutputProtocol?
    var localDatamanager: ProfileLocalDataManagerInputProtocol?
    var remoteDatamanager: ProfileRemoteDataManagerInputProtocol?
    
    var userService: UserServiceProtocol?
    
    
    func getPosts() {
        remoteDatamanager?.getPosts()
    }
    
    func logOut() {
        userService?.logOut()
    }

}
extension ProfileInteractor: ProfileRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func onPostsFetched(posts: [PostForCell]) {
        presenter?.onPostsFetched(posts: posts)
    }
}

extension ProfileInteractor: ProfileLocalDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
