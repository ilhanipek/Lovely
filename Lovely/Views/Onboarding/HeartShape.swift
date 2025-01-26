//
//  HeartShape.swift
//  MeRichy
//
//  Created by ilhan serhan ipek on 22.01.2025.
//

import Foundation
import SwiftUI

struct HeartShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height

        path.move(to: CGPoint(x: 0, y: height))

        path.addCurve(
            to: CGPoint(x: width / 1.8, y: height - 30),
            control1: CGPoint(x: width, y: -height / 8),
            control2: CGPoint(x: -width / 2, y: -height / 6)
        )

        path.addCurve(
            to: CGPoint(x: width, y: height - 100),
            control1: CGPoint(x: width * 1.5, y: -height / 8),
            control2: CGPoint(x: -width / 5, y: -height / 6)
        )

        return path
    }
}

#Preview(body: {
  LoveTabButton {

  }
})
