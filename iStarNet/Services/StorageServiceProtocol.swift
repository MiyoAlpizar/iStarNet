//
//  StorageServiceProtocol.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//

import Foundation
import UIKit


///Protocol to upload Images to server
protocol StorageServiceProtocol: AnyObject {
    
    func uploadImage(image: UIImage, path: String, name: String , completion: @escaping(Result<String, Error>) -> ())

}
