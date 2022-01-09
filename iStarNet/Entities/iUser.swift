//
//  iUser.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//

import Foundation

/// Struct to representate any user into the app
struct iUser: Codable {
    let id: String
    var name: String
    var imagePath: String?
    var email: String?
}
