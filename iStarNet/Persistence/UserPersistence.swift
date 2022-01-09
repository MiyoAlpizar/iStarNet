//
//  UserPersistence.swift
//  iStarNet
//
//  Created by Miyo on 08/01/22.
//

import Foundation

class UserPersistence {
    public static let shared = UserPersistence()
    
    private init () { }
    
    public func saveUser(user: iUser) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "user")
        }
    }
    
    public func getCurrentUser() -> iUser? {
        if let savedPerson = UserDefaults.standard.value(forKey: "user") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(iUser.self, from: savedPerson) {
                return loadedPerson
            }
        }
        return nil
    }
    
}

