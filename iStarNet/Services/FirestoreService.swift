//
//  FirestoreService.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//

import Firebase


///Firestore CRUD operations with generic functions
class FirestoreService {
    
    public static let shared = FirestoreService()
    
    private init() {}
    
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let db = Firestore.firestore()
    
    func get<T:Codable>(collection: String, uid: String, type: T.Type, completion: @escaping(Result<T, Error>) -> Void) {
        
        let ref = db.collection(collection).document(uid)
            
            ref.getDocument { snapshot, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let document = snapshot else {
                return
            }
            
            guard let data = document.data() else {
                print("No Existe \(collection) \(uid)")
                return
            }
            
            if let data = try? JSONSerialization.data(withJSONObject: data, options: []) {
                let result = try? self.decoder.decode(T.self, from: data)
                if let result = result {
                    completion(.success(result))
                }
            }else {
                print("No Existe \(collection) \(uid)")
            }
            
        }
        
    }
    
    func save<T:Encodable>(collection: String,_ obj: T, completion: @escaping(Result<String, Error>) -> Void) {
        let data = try? obj.dictionary()
        guard let data = data else {
            return
        }
        var ref: DocumentReference? = nil
        ref = db.collection(collection)
            .addDocument(data: data) { error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let ref = ref else {
                    return
                }
                completion(.success(ref.documentID))
            }
    }
    
    func update<T:Encodable>(collection: String, uid: String,_ obj: T, completion: @escaping(Result<Bool, Error>) -> Void) {
        let data = try? obj.dictionary()
        guard let data = data else {
            return
        }
        
        db.collection(collection).document(uid).setData(data, completion: { error in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(true))
        })
        
    }
    
    func delete(collection: String, uid: String, completion: @escaping(Result<Bool, Error>) -> Void) {
        db.collection(collection).document(uid).delete { error in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(true))
        }
    }
}
