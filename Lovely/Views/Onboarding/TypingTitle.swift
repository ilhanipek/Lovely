//
//  TypingTitle.swift
//  MeRichy
//
//  Created by ilhan serhan ipek on 22.01.2025.
//

import SwiftUI

struct TypingTitle: View {
  @State var displayigTitle: String = ""
  var fullText: String
  let typingSpeed: Double
  var startDelay: Double = 0
  var shouldStartTyping: Bool
  
  var body: some View {
    Text(displayigTitle)
      .foregroundStyle(AppColors.textDark)
      .onChange(of: shouldStartTyping) { newValue in
        if newValue {
          Task {
            try? await Task.sleep(nanoseconds: UInt64(startDelay * 1_000_000_000))
            await startTyping()
          }
        }
      }
  }

  private func startTyping() async{
    for (index, character) in fullText.enumerated() {
      DispatchQueue.main.asyncAfter(deadline: .now() + typingSpeed * Double(index), execute: {
        displayigTitle.append(character)
      })
    }
  }
}

#Preview {
  TypingTitle(fullText: "Full Title", typingSpeed: 0.1, shouldStartTyping: true)
}
