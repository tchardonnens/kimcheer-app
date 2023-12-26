//
//  MiniCard.swift
//  Kimcheer
//
//  Created by Thomas CHARDONNENS on 26/12/2023.
//

import Foundation

import SwiftUI

struct MiniCard: View {
    
    let question: Question
    
    var body: some View {
        FrontCardView(question: question)
            .minicard()
    }
}

struct MiniCard_Previews: PreviewProvider {
    static var previews: some View {
        MiniCard(question:  Constants.questions.first!)
    }
}
