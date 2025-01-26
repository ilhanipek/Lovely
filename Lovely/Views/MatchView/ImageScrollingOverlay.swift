//
//  ImageScrollingOverlay.swift
//  MeRichy
//
//  Created by ilhan serhan ipek on 24.01.2025.
//

import SwiftUI

struct ImageScrollingOverlay: View {
  @Binding var currentImageIndex: Int
  var cardImageCount: Int
    var body: some View {
      HStack {
        Rectangle()
          .onTapGesture {
            updateImageIndex(increment: false)
          }
        Rectangle()
          .onTapGesture {
            updateImageIndex(increment: true)
          }
      }
      .foregroundStyle(Color.white.opacity(0.01))
    }
}

private extension ImageScrollingOverlay {
  func updateImageIndex(increment: Bool) {
    if increment {
      if cardImageCount != currentImageIndex {
        currentImageIndex += 1
      }
    } else {
      if currentImageIndex != 0 {
        currentImageIndex -= 1
      }
    }
  }
}

#Preview {
  ImageScrollingOverlay(currentImageIndex: .constant(0), cardImageCount: 1)
}
