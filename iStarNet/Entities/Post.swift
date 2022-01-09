//
//  Post.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//

import Foundation

///Model to represent a Post coming from server database
struct Post {
    let user: iUser
    let date: Date
    let comments: String
    let currentUserLiked: Bool
    let likes: Int
    let imageUrl: String?
}
