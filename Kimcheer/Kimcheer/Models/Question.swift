//
//  Question.swift
//  Kimcheer
//
//  Created by Thomas CHARDONNENS on 24/12/2023.
//

import Foundation

struct Question: Codable {
    var id: Int
    var korean: String
    var english: String
    var pronounciation: String
    var example: String
    var tone: String
    var answers: [String]
}

extension Question: Identifiable {
    
}
