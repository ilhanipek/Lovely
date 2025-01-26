//
//  MainTabView.swift
//  MeRichy
//
//  Created by ilhan serhan ipek on 22.01.2025.
//

import SwiftUI

struct MainTabView: View {
  @StateObject var homeVM = HomeViewModel.shared

  var body: some View {
    ZStack{
      AppColors.backgroundWhite.ignoresSafeArea()
      VStack{
        Spacer()
        if(homeVM.selectTab == 0) {
          MatchView()
        }else if(homeVM.selectTab == 1) {
          ChatView()
        }else if(homeVM.selectTab == 2) {
          PreferencesView()
        }else if(homeVM.selectTab == 3) {
          ProfileView()
        }

        Spacer()

        HStack{
          LoveTabButton(isSelect: homeVM.selectTab == 0) {
            homeVM.selectTab = 0
          }

          TabButton(title: "Chat", icon: "bubble", isSelect: homeVM.selectTab == 1) {
            homeVM.selectTab = 1
          }

          TabButton(title: "Preferences", icon: "slider.horizontal.3", isSelect: homeVM.selectTab == 2) {
            homeVM.selectTab = 2
          }

          TabButton(title: "Profile", icon: "person", isSelect: homeVM.selectTab == 3) {
            homeVM.selectTab = 3
          }
        }
        .padding(.top, 20)
        .padding(.bottom,20)
        .padding(.horizontal, 10)
        .background(Color.white)
        .cornerRadius(15)
      }
    }
    .navigationTitle("")
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
    .ignoresSafeArea(.all, edges: .bottom)
  }
}

#Preview {
  MainTabView()
}
