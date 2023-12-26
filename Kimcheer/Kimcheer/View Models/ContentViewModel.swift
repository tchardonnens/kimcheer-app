//
//  ContentViewModel.swift
//  Kimcheer
//
//  Created by Thomas CHARDONNENS on 24/12/2023.
//

import Foundation
import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published var splashScreenState = SplashScreenState.on
    
    init() {
        let splashAnimation = LiyAnimation(.spring, duration: 1) {
            self.splashScreenState = .off
        }

        splashAnimation.playAfter(duration: 1.5)
    }
}

enum SplashScreenState {
    case on, off
}
