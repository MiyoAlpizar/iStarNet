//
//  HomePresenter.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//  
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.getPosts()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func onPostFetched(posts: [PostForCell]) {
        view?.onPostFetched(posts: posts)
    }
   
}
