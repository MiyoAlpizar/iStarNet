//
//  Question.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//

import Foundation

// MARK: - QuestionResult
struct QuestionResult: Codable {
    let colors: [String]
    let questions: [Question]
}

// MARK: - Question
struct Question: Codable {
    let total: Int
    let text: String
    let chartData: [ChartDatum]
}

// MARK: - ChartDatum
struct ChartDatum: Codable {
    let text: String
    let percetnage: Double
}
