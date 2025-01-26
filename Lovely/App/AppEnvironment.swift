//
//  AppEnvironment.swift
//  MeRichy
//
//  Created by ilhan serhan ipek on 21.01.2025.
//

import Foundation

class AppEnvironment {
  static let shared = AppEnvironment()
  
}

struct LocalState {
  enum Keys: String {
    case hasOnboarded
  }

  var hasOnboarded: Bool {
    get {
      return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
    }
    set(newValue) {
      UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
    }
  }
}
