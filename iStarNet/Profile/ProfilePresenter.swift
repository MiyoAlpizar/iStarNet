//
//  ProfilePresenter.swift
//  iSocialNet
//
//  Created by Miyo on 26/12/21.
//  
//

import Foundation

class ProfilePresenter  {
    
    // MARK: Properties
    weak var view: ProfileViewProtocol?
    var interactor: ProfileInteractorInputProtocol?
    var wireFrame: ProfileWireFrameProtocol?
        
    func logOut() {
        interactor?.logOut()
        wireFrame?.goStart()
        
    }
}

extension ProfilePresenter: ProfilePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.getPosts()
    }
    
}

extension ProfilePresenter: ProfileInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func onPostsFetched(posts: [PostForCell]) {
        view?.onPostsFetched(posts: posts)
    }
}
