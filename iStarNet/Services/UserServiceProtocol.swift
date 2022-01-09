//
//  UserServiceProtocol.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//

import FirebaseAuth

///User sesión protocol functions
protocol UserServiceProtocol: AnyObject {
    
    func resgisterWithEmail(email: String, password: String, completion: @escaping(Result<iUser, Error>) -> ())
    
    func loginWithEmail(email: String, password: String, completion: @escaping(Result<iUser, Error>) -> ())
    
    func recoveryPasswordByEmail(email: String, completion: @escaping(Result<Bool, Error>)  -> ())
    
    func isLoggedIn() -> Bool
    
    func logOut()
    
    func getCurrentUser(completion: @escaping(Result<iUser, Error>) -> ())
}
