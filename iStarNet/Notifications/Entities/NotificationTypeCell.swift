//
//  NotificationTypeCell.swift
//  iSocialNet
//
//  Created by Miyo on 26/12/21.
//

import Foundation

enum NotificationType {
    case noti
    case post
}

struct NotificationTypeCell {
    let type: NotificationType
    let data: Any
}

