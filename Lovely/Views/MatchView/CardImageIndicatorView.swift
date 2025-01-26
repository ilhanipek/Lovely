//
//  CardImageIndicatorView.swift
//  MeRichy
//
//  Created by ilhan serhan ipek on 24.01.2025.
//

import SwiftUI

struct CardImageIndicatorView: View {
  var currentImageIndex: Int
  var imageCount: Int
    var body: some View {
      HStack {
        ForEach(0..<imageCount, id: \.self) { index in
          Capsule()
            .foregroundStyle(currentImageIndex == index ? AppColors.primaryPink : .gray)
            .frame(width: (UIScreen.main.bounds.width / CGFloat(imageCount)) - 25, height: 4, alignment: .center)
        }
      }
      .padding(.top)
    }
}

#Preview {
  CardImageIndicatorView(currentImageIndex: 0, imageCount: 3)
}
