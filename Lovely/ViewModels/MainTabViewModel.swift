//
//  MainTabViewModel.swift
//  MeRichy
//
//  Created by ilhan serhan ipek on 23.01.2025.
//

import Foundation

class HomeViewModel : ObservableObject {

  static let shared = HomeViewModel()

  @Published var selectTab: Int = 0
  
}
