//
//  FirebaseService.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//

import FirebaseAuth


///Class that implements UserServiceProtocol with Firebase
class FirebaseUserService: UserServiceProtocol {
    
    func resgisterWithEmail(email: String, password: String, completion: @escaping (Result<iUser, Error>) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let result = result {
                completion(.success(result.user.toiUser()))
            }
        }
    }
    
    func loginWithEmail(email: String, password: String, completion: @escaping (Result<iUser, Error>) -> ()) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let result = result {
                
                FirestoreService.shared.get(collection: FirebaseConstants.Collections.users, uid: result.user.uid, type: iUser.self) { result in
                    
                    switch result {
                    case .failure(let error):
                        print(error.localizedDescription)
                        completion(.failure(error))
                    case .success(let iUser):
                        completion(.success(iUser))
                    }
                    
                }
            }
        }
        
    }
    
    func recoveryPasswordByEmail(email: String, completion: @escaping (Result<Bool, Error>) -> ()) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                completion(.failure(error))
            }else {
                completion(.success(true))
            }
        }
    }
    
    func isLoggedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        }
        catch {
            print("already logged out")
        }
    }
    
    func getCurrentUser(completion: @escaping (Result<iUser, Error>) -> ()) {
        guard let user = Auth.auth().currentUser else {
            completion(.failure(NSError(domain: "No se encontró usuario", code: 1, userInfo: nil)))
            return
        }
        
        FirestoreService.shared.get(collection: FirebaseConstants.Collections.users, uid: user.uid, type: iUser.self) { result in
            
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            case .success(let iUser):
                var newUser = iUser
                newUser.email = user.email
                completion(.success(newUser))
            }
            
        }
        
        
    }
}
