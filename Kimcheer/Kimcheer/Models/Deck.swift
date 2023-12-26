//
//  Deck.swift
//  Kimcheer
//
//  Created by Thomas CHARDONNENS on 24/12/2023.
//

import Foundation

struct Deck: Codable {
    var id: Int
    var name: String
    var questionIds: [Int]
    
    var questions: [Question] {
        Constants.questions.filter { questionIds.contains($0.id) }
    }
}

extension Deck: Identifiable {
    
}
