//
//  SignUpWireFrame.swift
//  iSocialNet
//
//  Created by Miyo on 23/12/21.
//  
//

import Foundation
import UIKit

class SignUpWireFrame: SignUpWireFrameProtocol {
    class func createSignUpModule() -> UIViewController {
        
        let view = SignUpView.instance()
        view.navigationItem.title = "Crear cuenta"
        
        let presenter: SignUpPresenterProtocol & SignUpInteractorOutputProtocol = SignUpPresenter()
        let interactor: SignUpInteractorInputProtocol & SignUpLocalDataManagerOutputProtocol & SignUpRemoteDataManagerOutputProtocol = SignUpInteractor()
        let localDataManager: SignUpLocalDataManagerInputProtocol = SignUpLocalDataManager()
        let remoteDataManager: SignUpRemoteDataManagerInputProtocol = SignUpRemoteDataManager()
        let wireFrame: SignUpWireFrameProtocol = SignUpWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        
        remoteDataManager.remoteRequestHandler = interactor
        remoteDataManager.firestoreService = FirestoreService.shared
        remoteDataManager.userService = FirebaseUserService()
        remoteDataManager.storageService = FirebaseStorageService()
        
        localDataManager.localRequestHandler = interactor
        
        return view
        
    }
    
    func openImagePicker(from view: SignUpViewProtocol, type: UIImagePickerController.SourceType) {
        guard let view = view as? SignUpView else { return }
        
        let vc = UIImagePickerController()
        vc.sourceType = type
        vc.cameraCaptureMode = .photo
        vc.cameraDevice = .front
        vc.allowsEditing = true
        vc.delegate = view
        view.present(vc, animated: true)
        
    }
    
    func goMain() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = MainTabWireFrame.createMainTabModule()
    }
    
}
