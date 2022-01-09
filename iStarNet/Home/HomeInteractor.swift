//
//  HomeInteractor.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?

    func getPosts() {
        remoteDatamanager?.getPosts()
    }
}
extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func onPostsFetched(posts: [PostForCell]) {
        presenter?.onPostFetched(posts: posts)
    }
    
}

extension HomeInteractor: HomeLocalDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
