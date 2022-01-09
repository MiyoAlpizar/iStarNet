//
//  SignUpRemoteDataManager.swift
//  iSocialNet
//
//  Created by Miyo on 23/12/21.
//  
//

import Foundation
import UIKit

class SignUpRemoteDataManager:SignUpRemoteDataManagerInputProtocol {
    var userService: UserServiceProtocol?
    var storageService: StorageServiceProtocol?
    var firestoreService: FirestoreService?
    var remoteRequestHandler: SignUpRemoteDataManagerOutputProtocol?
    
    func registerUser(email: String, pwd: String, image: UIImage) {
        userService?.resgisterWithEmail(email: email, password: pwd, completion: { result in
            
            switch result {
            case .failure(let error):
                    print(error)
                self.remoteRequestHandler?.onError(error: error.localizedDescription)
            case .success(let user):
                var newUser = user
                newUser.email = email
                self.uploadImage(image: image, user: newUser)
            }
            
        })
    }
    
    private func uploadImage(image: UIImage, user: iUser) {
        storageService?.uploadImage(image: image, path: FirebaseConstants.Storages.users, name: user.id, completion: { results in
            switch results {
            case .failure(let error):
                    print(error)
                self.remoteRequestHandler?.onError(error: error.localizedDescription)
            case .success(let url):
                var newUser = user
                newUser.imagePath = url
                self.saveUser(user: newUser)
            }
        })
    }
    
    private func saveUser(user: iUser) {
        firestoreService?.update(collection: FirebaseConstants.Collections.users,uid: user.id, user, completion: { result in
            switch result {
            case .failure(let error):
                print(error)
                self.remoteRequestHandler?.onError(error: error.localizedDescription)
            case .success(let uid):
                print(uid)
                self.remoteRequestHandler?.onUserRegistered(user: user)
                UserPersistence.shared.saveUser(user: user)
            }
        })
    }
    
}
