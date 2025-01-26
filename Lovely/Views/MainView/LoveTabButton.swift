//
//  LoveTabButton.swift
//  MeRichy
//
//  Created by ilhan serhan ipek on 23.01.2025.
//

import SwiftUI

struct LoveTabButton: View {
  @State private var animationProgress: CGFloat = 0.0
  var title: String = "Lovely"
  var isSelect: Bool = false
  var didSelect: (()->())

  var body: some View {
    Button {
      didSelect()
    } label: {
      VStack {
        HeartShapeIcon()
          .trim(from: 0, to: animationProgress)
          .stroke(isSelect ? AppColors.primaryPink : AppColors.textDark.opacity(0.34), lineWidth: 3)
          .frame(width: 32, height: 32, alignment: .center)
          .animation(.linear(duration: 3).repeatForever(autoreverses: false), value: animationProgress)
        Text(title)
          .font(.system(size: 14))
      }
      .scaledToFit()
    }
    .foregroundColor(isSelect ? AppColors.primaryPink : AppColors.textDark.opacity(0.34))
    .frame(minWidth: 0, maxWidth: .infinity)
    .onAppear {
      animationProgress = 1.0
    }
  }
}

struct HeartShapeIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height

        path.move(to: CGPoint(x: 0, y: height / 2))

      path.addCurve(
          to: CGPoint(x: width / 1.8, y: height - 10),
          control1: CGPoint(x: width, y: -height / 8),
          control2: CGPoint(x: -width / 2, y: -height / 6)
      )

      path.addCurve(
          to: CGPoint(x: width, y: height - 20),
          control1: CGPoint(x: width * 1.5, y: -height / 8),
          control2: CGPoint(x: -width / 5, y: -height / 6)
      )

        return path
    }
}

#Preview {
  LoveTabButton {

  }
}
