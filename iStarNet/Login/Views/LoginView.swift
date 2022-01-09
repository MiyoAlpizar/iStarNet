//
//  LoginView.swift
//  iSocialNet
//
//  Created by Miyo on 23/12/21.
//  
//

import Foundation
import UIKit

class LoginView: UIViewController {

    // MARK: Properties
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var btnLogin: UIButton!
    var presenter: LoginPresenterProtocol?
    var cancelButton: UIBarButtonItem?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addActions()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        txtEmail.becomeFirstResponder()
    }
    
    func addActions() {
        cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem = cancelButton
        
        txtEmail.delegate = self
        txtPwd.delegate = self
    }
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func btnLogin_Pressed(_ sender: Any) {
        validateLogin()
    }
    
    func validateLogin() {
        guard let email = txtEmail.text else {
            self.alert(message: "Debes ingresar un correo válido")
            txtEmail.becomeFirstResponder()
            return
        }
        
        guard email.isValidEmail() else {
            self.alert(message: "Debes ingresar un correo válido")
            txtEmail.becomeFirstResponder()
            return
        }
        
        guard let pwd = txtPwd.text else {
            self.alert(message: "Debes ingresar una contraseña de más de 6 caracteres")
            txtPwd.becomeFirstResponder()
            return
        }
        
        guard pwd.trim().count > 5 else {
            self.alert(message: "Debes ingresar una contraseña de más de 6 caracteres")
            txtPwd.becomeFirstResponder()
            return
        }
        activity.startAnimating()
        btnLogin.isEnabled = false
        cancelButton?.isEnabled = false
        activity.alpha = 1
        view.endEditing(true)
        presenter?.loginUser(email: email, pwd: pwd)
        //presenter?.registerUser(email: email, pwd: pwd, imageProfile: image)
        
    }
}

extension LoginView: LoginViewProtocol {
    // TODO: implement view output methods
    func onUserLogged(user: iUser) {
        
    }
    
    func onUserLoginError(error: Error) {
        activity.stopAnimating()
        btnLogin.isEnabled = true
        activity.alpha = 0
        cancelButton?.isEnabled = true
        self.alert(message: error.localizedDescription) {
            self.txtPwd.becomeFirstResponder()
        }
    }
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtEmail {
            guard let txt = txtEmail.text else { return false }
            guard txt.isValidEmail() else {
                return false
            }
            txtPwd.becomeFirstResponder()
        }
        
        if textField == txtPwd {
            guard let txt = txtPwd.text else { return false }
            guard txt.count > 5 else {
                return false
            }
            validateLogin()
        }
        return true
    }
    
}
