import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        Image("splashScreen")
            .resizable()
            .ignoresSafeArea()
    }
}

#Preview {
    SplashScreenView()
}
