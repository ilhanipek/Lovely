//
//  MeRichyApp.swift
//  MeRichy
//
//  Created by ilhan serhan ipek on 20.01.2025.
//

import SwiftUI

@main
struct LovelyApp: App {
    let httpClient = HTTPClient()
    @State private var localState = LocalState()
    
    var body: some Scene {
        WindowGroup {
            if !localState.hasOnboarded {

            } else {
                OnboardingView()
            }
        }
    }
}
