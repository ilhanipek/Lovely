//
//  GetStartedButton.swift
//  MeRichy
//
//  Created by ilhan serhan ipek on 22.01.2025.
//

import SwiftUI

struct GetStartedButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Get Started")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(AppColors.primaryPink)
                .cornerRadius(15)
        }
    }
}

#Preview {
    GetStartedButton {}
}
