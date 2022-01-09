//
//  SignUpView.swift
//  iSocialNet
//
//  Created by Miyo on 23/12/21.
//  
//

import Foundation
import UIKit

class SignUpView: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    @IBOutlet weak var txtPwd2: UITextField!
    @IBOutlet weak var btnImageProfile: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var activityInidicator: UIActivityIndicatorView!
    
    var presenter: SignUpPresenterProtocol?
    var cancelButton: UIBarButtonItem?
    var isFirstAppear = true
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        addActions()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isFirstAppear {
            txtEmail.becomeFirstResponder()
            isFirstAppear = false
        }
    }
    
    func addActions() {
        cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem = cancelButton
        
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector (selectPictureProfile))
        imgProfile.addGestureRecognizer(tapGesture)
        
        txtEmail.delegate = self
        txtPwd.delegate = self
        txtPwd2.delegate = self
    }
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func btnProfile_Pressed(_ sender: Any) {
        selectPictureProfile()
    }
    
    
    @IBAction func btnRegister_Pressed(_ sender: Any) {
        validateRegister()
    }
    
    func validateRegister() {
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
        
        guard txtPwd.text == txtPwd2.text else {
            self.alert(message: "Las contraseñas no coinciden")
            txtPwd2.becomeFirstResponder()
            return
        }
        
        guard let image = imgProfile.image else {
            self.alert(message: "Debes subir tu selfie") {
                self.selectPictureProfile()
            }
            return
        }
        view.endEditing(true)
        presenter?.registerUser(email: email, pwd: pwd, imageProfile: image)
        
    }
    
    @objc func selectPictureProfile() {
        presenter?.openImagePicker(type: UIImagePickerController.SourceType.camera)
    }
    
}

extension SignUpView: SignUpViewProtocol {
    
    func onRegisterUserError(error: String) {
        self.alert(title: "Error", message: error)
    }
    
    func onRegsiterUserSuccess() {
        
    }
    
    func isLoading(loading: Bool) {
        if loading {
            activityInidicator.startAnimating()
            activityInidicator.alpha = 1
            btnRegister.isEnabled = false
            cancelButton?.isEnabled = false
            
        }else {
            activityInidicator.stopAnimating()
            activityInidicator.alpha = 0
            btnRegister.isEnabled = true
            cancelButton?.isEnabled = true
        }
        
    }
    
    // TODO: implement view output methods
    func canRegisterChanged(canRegister: Bool) {
        btnRegister.isEnabled = canRegister
    }
}

extension SignUpView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        var newImage: UIImage
        if let possibleImage = info[.editedImage] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info[.originalImage] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }
        newImage.jpegData(compressionQuality: 0.8)
        imgProfile.image = newImage
    }
    
}

extension SignUpView: UITextFieldDelegate {
    
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
            txtPwd2.becomeFirstResponder()
        }
        
        if textField == txtPwd2 {
            validateRegister()
        }
        return true
    }
}
