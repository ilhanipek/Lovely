import SwiftUI

struct OnboardingView: View {
  @StateObject private var viewModel = OnboardingViewModel()
  @State private var navigateToMain = false
  @State private var animationProgress: CGFloat = 0.0
  @State private var startTyping = false
  @State private var showDescription = false

  let screenWidth = UIScreen.main.bounds.width
  let screenHeight = UIScreen.main.bounds.height / 2.5
  
  var body: some View {
    NavigationStack {
      ZStack {
        AppColors.backgroundWhite
          .ignoresSafeArea()
        VStack {
          RoundedRectangle(cornerRadius: 70)
            .fill(.white)
            .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 5)
            .frame(height: screenHeight * 1.5)
            .overlay {
              HeartShape()
                .trim(from: 0, to: animationProgress)
                .stroke(AppColors.primaryPink, lineWidth: 10)
                .frame(width: screenWidth / 1.3, height: screenHeight / 1.3)
            }

          VStack(alignment: .center) {
            HStack {
              TypingTitle(
                fullText: "Find Your Relationship",
                typingSpeed: 0.09,
                shouldStartTyping: startTyping
              )
              .font(.title2)
              .bold()
              Spacer()
            }
            .padding(.top, 30)
            
            HStack {
              TypingTitle(
                fullText: "Lovely",
                typingSpeed: 0.075,
                startDelay: 1.5,
                shouldStartTyping: startTyping
              )
              .font(.title)
              .bold()
              Spacer()
            }
            
            VStack(spacing: 25) {
              HStack {
                Text("Build stronger bonds through meaningful interactions.")
                  .font(.body)
                  .foregroundColor(.gray)
                  .frame(width: screenWidth / 1.6, height: 40, alignment: .leading)
                  .padding( 5)
                  .lineLimit(2)
                  .minimumScaleFactor(0.7)
                Spacer()
              }
              HStack {
                GetStartedButton {
                  viewModel.completeOnboarding()
                  navigateToMain = true
                }
                Spacer()
              }
            }
            .opacity(showDescription ? 1 : 0)
            .animation(.easeIn(duration: 1), value: showDescription)
          }
          .padding()
          Spacer()
        }
        .navigationDestination(isPresented: $navigateToMain) {
          MainTabView()
        }
      }
      .ignoresSafeArea()

    }
    .onAppear {
      withAnimation(.linear(duration: 3)) {
        animationProgress = 1.0
      }
      DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        startTyping = true
      }
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
        showDescription = true
      }
    }
  }
}

#Preview {
  OnboardingView()
}
