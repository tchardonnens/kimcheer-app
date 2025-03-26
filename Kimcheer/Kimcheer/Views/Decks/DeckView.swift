//
//  DeckView.swift
//  Kimcheer
//
//  Created by Thomas CHARDONNENS on 26/12/2023.
//

import Foundation
import SwiftUI

struct DeckView: View {
    
    let deck: Deck
    
    @StateObject var vm = DeckViewModel()
    @State private var answerText = ""
    
    var body: some View {
        VStack {
            ZStack {
                cardPile
                flashMarks
            }
            endScreen
            answerInput
        }
        .navigationTitle(deck.name)
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            vm.setupDeck(deck)
        }
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView(deck: Constants.decks.first!)
    }
}

extension DeckView {
    private var cardPile: some View {
        ZStack {
            ForEach(vm.cards.indices, id: \.self) { index in
                questionCard(question: vm.cards[index], isTopCard: index == vm.cards.count-1)
            }
        }
    }
    
    private func questionCard(question: Question, isTopCard: Bool) -> some View {
        cardSides(question: question, isTopCard: isTopCard)
            .transition(.slide)
            .zIndex(isTopCard ? 999 : 0)
            .allowsHitTesting(isTopCard ? true : false)
    }
    
    private func cardSides(question: Question, isTopCard: Bool) -> some View {
        ZStack {
            FrontCardView(question: question)
                .rotation3DEffect(.degrees(isTopCard ? vm.rotation : 0), axis: (x: 0, y: 1, z: 0))
                .opacity(isTopCard ? vm.flipped ? 0 : 1 : 1)
            BackCardView(question: question)
                .rotation3DEffect(.degrees(isTopCard ? vm.rotation + 180 : 0), axis: (x: 0, y: 1, z: 0))
                .opacity(isTopCard ? vm.flipped ? 1 : 0 : 0)
        }
    }
    
    private var answerInput: some View {
        VStack {
            TextField("Enter your answer", text: $answerText)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
            
            Button {
                vm.submitAnswer(answerText)
                answerText = ""
            } label: {
                Text("Submit")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            .disabled(vm.deckState != .playing || answerText.isEmpty)
        }
        .padding(.bottom)
        .opacity(vm.deckState == .playing && !vm.cards.isEmpty ? 1 : 0)
    }
    
    @ViewBuilder
    private var flashMarks: some View {
        if vm.deckState == .submitting {
            ZStack {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
                    .fontWeight(.thin)
                    .font(.system(size: 200))
                    .opacity(vm.passing ? 1 : 0)
                
                Image(systemName: "x.circle")
                    .foregroundColor(.red)
                    .fontWeight(.thin)
                    .font(.system(size: 200))
                    .opacity(vm.failing ? 1 : 0)
            }
        }
    }
    
    @ViewBuilder
    private var endScreen: some View {
        if vm.deckState == .finished {
            ScrollView {
                VStack {
                    ForEach(vm.stats) { statistic in
                        HStack {
                            Text(statistic.question.korean)
                                .font(.title)
                            Image(systemName: statistic.wasCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                                .foregroundColor(statistic.wasCorrect ? .green : .red)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
