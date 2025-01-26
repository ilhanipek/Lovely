//
//  OnboardingViewModel.swift
//  MeRichy
//
//  Created by ilhan serhan ipek on 22.01.2025.
//

import Foundation

class OnboardingViewModel: ObservableObject {
  private var localState = LocalState()

    func completeOnboarding() {
        localState.hasOnboarded = true
    }
} 
