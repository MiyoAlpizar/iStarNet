//
//  FirebaseStorageService.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//

import FirebaseStorage

///Class tha implements StorageServiceProtocol to upload images to FireStorage
class FirebaseStorageService: StorageServiceProtocol {
    
    let storage = Storage.storage()
   
    func uploadImage(image: UIImage, path: String, name: String, completion: @escaping (Result<String, Error>) -> ()) {
        let storageRef = storage.reference()
        let fileRef = storageRef.child("\(path)/\(name)")
        
        guard let image = image.jpegData(compressionQuality: 0.8) else {
            completion(.failure(NSError(domain: "No se encontró imagen", code: 1, userInfo: nil)))
            return
        }
        
        fileRef.putData(image, metadata: nil) { metadata, error in
            guard  metadata != nil else {
                completion(.failure(NSError(domain: "Error desconocido", code: 4, userInfo: nil)))
                return
            }
            
            fileRef.downloadURL { url, error in
                guard let url = url else {
                    if let error = error {
                        completion(.failure(error))
                    }else {
                        completion(.failure(NSError(domain: "Error desconocido", code: 4, userInfo: nil)))
                    }
                    return
                }
                print(url)
                completion(.success(url.description))
            }
        }
        
    }
    
}
