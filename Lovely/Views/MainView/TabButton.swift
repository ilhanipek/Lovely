//
//  TabButton.swift
//  MeRichy
//
//  Created by ilhan serhan ipek on 23.01.2025.
//

import SwiftUI

struct TabButton: View {

    @State var title: String = "Title"
    @State var icon: String = "Desti"
    var isSelect: Bool = false
    var didSelect: (()->())

    var body: some View {
        Button {
            debugPrint("Tab Button Tap")
            didSelect()
        } label: {
            VStack{
              Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)

                Text(title)
                .font(.system(size: 14))

            }
        }
        .foregroundColor(isSelect ? AppColors.primaryPink : AppColors.textDark.opacity(0.34) )
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

#Preview {
  TabButton {
    print("Tapped")
  }
}
