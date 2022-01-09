//
//  Message.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//

import Foundation

///Model to represent a Conversation coming from server database
struct Conversation {
    let fromUser: iUser
    let messages: [Message]
}

///Model to represent a Message coming from server database
struct Message {
    let uid: String
    let message: String
    let date: Date
    let seen: Bool
}
