//
//  QuestionForCell.swift
//  iSocialNet
//
//  Created by Miyo on 26/12/21.
//

import Foundation
import UIKit

struct QuestionForCell {
    let question: String
    var responses: [QuestionResponseForCell]
}

struct QuestionResponseForCell {
    let data: String
    let value: Double
    let color: UIColor
}

