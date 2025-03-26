//
//  Constants.swift
//  Kimcheer
//
//  Created by Thomas CHARDONNENS on 24/12/2023.
//

import Foundation

enum Constants {
    static let appTitle: String = "Kimcheer"
    static let questions: [Question] = Bundle.main.decode("cardData.json")
    static let decks: [Deck] = Bundle.main.decode("decks.json")
    static let cardHeight: CGFloat = 400
    static let cardWidth: CGFloat = 300
    static let nextCardAnimationLength = 1.0
    static let cardFlipAnimationLength: Double = 0.4
    static var halfFlipAnimationLength: Double { Constants.cardFlipAnimationLength / 2 }
    static let flashAnimationLength: Double = 0.33
    static let setupDuration = 1.0
}
