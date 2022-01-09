//
//  StartView.swift
//  iSocialNet
//
//  Created by Miyo on 23/12/21.
//  
//

import Foundation
import UIKit

class StartView: UIViewController {

    // MARK: Properties
    var presenter: StartPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func createAccount_Pressed(_ sender: Any) {
        presenter?.openSignUp()
    }
    
    @IBAction func login_Pressed(_ sender: Any) {
        presenter?.openLogin()
    }
    
}

extension StartView: StartViewProtocol {
    // TODO: implement view output methods
    
    func userIsLoggedIn() {
        presenter?.goMain()
    }
    
}
