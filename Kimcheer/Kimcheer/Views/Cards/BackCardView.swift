//
//  BackCardView.swift
//  Kimcheer
//
//  Created by Thomas CHARDONNENS on 24/12/2023.
//

import Foundation
import SwiftUI

struct BackCardView: View {

    let question: Question
    var body: some View {
        VStack {
            Text(question.korean)
                .foregroundColor(.black)
                .font(.largeTitle)
                .fontWeight(.black)
        }
        .card()
    }
}

struct BackCardView_Previews: PreviewProvider {
    static var previews: some View {
        BackCardView(question: Constants.questions.first!)
    }
}
