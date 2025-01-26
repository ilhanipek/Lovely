//
//  CardDetail.swift
//  MeRichy
//
//  Created by ilhan serhan ipek on 23.01.2025.
//

import SwiftUI

struct CardDetail: View {
  let card: CardModel
    var body: some View {
      VStack(alignment: .leading) {
        HStack {
          Text(card.name)
            .font(.system(size: 33))
            .fontWeight(.heavy)
            .foregroundStyle(AppColors.primaryPink)
          Text(card.age)
            .font(.system(size: 30))
            .fontWeight(.semibold)
            .foregroundStyle(AppColors.secondaryPink)
          Spacer()

          Button {

          } label: {
            Image(systemName: "arrow.up.circle")
              .fontWeight(.bold)
              .font(.system(size: 25))
          }
        }
        Text(card.description)
          .font(.system(size: 25))
          .lineLimit(2)
          .foregroundStyle(AppColors.textDark)
      }
      .padding()
      .background {
        LinearGradient(colors: [.clear, AppColors.secondaryPink.opacity(0.8)], startPoint: .top, endPoint: .bottom)
      }
    }
}

#Preview {
    let previewCard = CardModel(id: 1, name: "Desti", age: "25", gender: .female, description: "I live in kocaeli", imgs: ["Desti"])
    return CardDetail(card: previewCard)
}
