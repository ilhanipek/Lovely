//
//  CardView.swift
//  MeRichy
//
//  Created by ilhan serhan ipek on 22.01.2025.
//

import SwiftUI

struct CardView: View {
  @State var card: CardModel
  @State var xOffSet: CGFloat = 0
  @State var degrees: Double = 0

  @State private var mockImages = ["Desti", "İlhan"]
    var body: some View {
      ZStack {
        ZStack(alignment: .top) {
          Image(mockImages[card.currentImgIndex])
            .resizable()
            .scaledToFill()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
              ImageScrollingOverlay(currentImageIndex: $card.currentImgIndex, cardImageCount: card.imgCount)
            }
          CardImageIndicatorView(currentImageIndex: card.currentImgIndex, imageCount: card.imgCount + 1)
          SwipeActionIndicatorView(xOffset: $xOffSet, screenCutoff: screenCutOff)
        }
        VStack {
          Spacer()
          CardDetail(card: card)
        }
      }
      .frame(width: cardwidth, height: cardHeight, alignment: .center)
      .offset(x: xOffSet)
      .rotationEffect(Angle(degrees: degrees))
      .animation(.snappy, value: xOffSet)
      .gesture(
        DragGesture()
        .onChanged({ value in
          xOffSet = value.translation.width
          degrees = Double(value.translation.width / 25)
      })
        .onEnded({ value in
          if abs(value.translation.width) <= abs(screenCutOff) {
            returnToCenter()
          } else if value.translation.width > screenCutOff {
            swipeRight()
          } else if value.translation.width < screenCutOff {
            swipeLeft()
          }
        })
      )
    }
}

private extension CardView {
  func returnToCenter() {
    xOffSet = 0
    degrees = 0
  }

  func swipeRight() {
    xOffSet = 500
    degrees = 12
  }
  func swipeLeft() {
    xOffSet = -500
    degrees = -12
  }
}

private extension CardView {
  var screenCutOff: CGFloat {
    return (UIScreen.main.bounds.width / 2) * 0.8
  }

  var cardwidth: CGFloat {
    return UIScreen.main.bounds.width - 20
  }

  var cardHeight: CGFloat {
    return UIScreen.main.bounds.height / 1.7
  }
}

#Preview {
  let card1 = CardModel(id: 1, name: "Desti", age: "25", gender: .female, description: "Hi, i live in kocaeli", imgs: ["Desti"])
  let card2 = CardModel(id: 2, name: "İlhan", age: "23", gender: .male, description: "Hi, i live in kocaeli", imgs: ["Desti"])
  CardView(card: card1)
}
