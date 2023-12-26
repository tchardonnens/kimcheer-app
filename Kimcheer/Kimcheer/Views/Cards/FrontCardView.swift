//
//  FrontCardView.swift
//  Kimcheer
//
//  Created by Thomas CHARDONNENS on 24/12/2023.
//

import Foundation
import SwiftUI

struct FrontCardView: View {
    
    let question: Question
    
    var body: some View {
        VStack {
            Text(question.korean)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("("+question.pronounciation+")").fontWeight(.thin)
            Divider()
            Text(question.english)
                .foregroundColor(.black)
                .fontWeight(.semibold)
            Text(question.tone)
            Divider()
            Text("Example:").fontWeight(.thin)
            Text(question.example).fontWeight(.thin)
            
        }.card()
    }
}

struct FrontCardView_Previews: PreviewProvider {
    static var previews: some View {
        FrontCardView(question: Constants.questions.first!)
    }
}

extension FrontCardView {
}
