//
//  MainTabPresenter.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//  
//

import Foundation

class MainTabPresenter  {
    
    // MARK: Properties
    weak var view: MainTabViewProtocol?
    var interactor: MainTabInteractorInputProtocol?
    var wireFrame: MainTabWireFrameProtocol?
    
}

extension MainTabPresenter: MainTabPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension MainTabPresenter: MainTabInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
