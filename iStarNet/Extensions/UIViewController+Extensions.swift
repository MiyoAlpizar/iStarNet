//
//  UIViewController+Extensions.swift
//  iSocialNet
//
//  Created by Miyo on 23/12/21.
//

import UIKit

extension UIViewController {
    ///Create instance from itself
    static func instance() -> Self {
        let id = String(describing: self)
        return Self(nibName: id, bundle: Bundle.main)
    }
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
    func alert(title: String? = "Atención", message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func alert(title: String? = "Atención", message: String?, buttonText: String = "Aceptar" , completion: @escaping() -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonText, style: UIAlertAction.Style.default, handler: { (uiaction) in
            completion()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func confirmAlert(title: String?, message: String, confirmText: String = "Confirm", completion: @escaping()-> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: confirmText, style: UIAlertAction.Style.default, handler: { (uiaction) in
            completion()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func confirmCancelAlert(title: String? = nil,message: String, confirmText: String, cancelText: String = "Cancelar" , onConfirm: @escaping()-> Void, onCancel: @escaping()-> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: confirmText, style: UIAlertAction.Style.default, handler: { (_) in
            onConfirm()
        }))
        
        alert.addAction(UIAlertAction(title: cancelText, style: UIAlertAction.Style.cancel, handler: {(_) in
            onCancel()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
