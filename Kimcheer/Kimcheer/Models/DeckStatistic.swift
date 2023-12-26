//
//  DeckStatistic.swift
//  Kimcheer
//
//  Created by Thomas CHARDONNENS on 24/12/2023.
//

import Foundation

struct DeckStatistic {
    let id = UUID()
    let question: Question
    let wasCorrect: Bool
}

extension DeckStatistic: Identifiable {
    
}
