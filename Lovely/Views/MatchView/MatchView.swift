//
//  MatchView.swift
//  MeRichy
//
//  Created by ilhan serhan ipek on 23.01.2025.
//

import SwiftUI

struct MatchView: View {
    var body: some View {
      ZStack {
        AppColors.backgroundWhite.ignoresSafeArea()
        ZStack {
          ForEach(0...10, id: \.self) { _ in
            CardView(card: CardModel(id: 1, name: "Desti", age: "25", gender: .female, description: "Hi, i live in kocaeli", imgs: ["Desti"]))
          }
        }
      }
    }
}

#Preview {
  let card1 = CardModel(id: 1, name: "Desti", age: "25", gender: .female, description: "Hi, i live in kocaeli", imgs: ["Desti"])
  let card2 = CardModel(id: 2, name: "İlhan", age: "23", gender: .male, description: "Hi, i live in kocaeli", imgs: ["Desti"])
  MatchView()
}
