//
//  ContentView.swift
//  Kimcheer
//
//  Created by Thomas CHARDONNENS on 24/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ContentViewModel()
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(Constants.appTitle).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Image("AppIconImage") // Name of the image asset
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100) // Adjust the size as needed

                if vm.splashScreenState == .on {
                    splashScreen
                } else {
                    mainScreen
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private var splashScreen: some View {
        VStack {
            ProgressView()
        }
    }
    
    private var mainScreen: some View {
        VStack {
            deckList
            Spacer()
        }
    }
    
    private var deckList: some View {
        VStack {
            ForEach(Constants.decks) { deck in
                NavigationLink(destination: DeckView(deck: deck)) {
                    Text(deck.name)
                        .padding()
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                        .background(.ultraThickMaterial)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)
                }
            }
        }
    }
}
