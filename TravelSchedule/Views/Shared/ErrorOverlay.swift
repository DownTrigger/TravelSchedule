import SwiftUI

struct ErrorOverlay: ViewModifier {
    @EnvironmentObject private var appState: AppState

    func body(content: Content) -> some View {
        content
            .overlay {
                if let error = appState.error {
                    ZStack {
                        Color("background").ignoresSafeArea()
                        ErrorView(error: error)
                    }
                }
            }
            #if DEBUG
            .overlay(alignment: .bottomTrailing) {
                VStack(spacing: 8) {
                    Button {
                        appState.error = appState.error == .server ? nil : .server
                    } label: {
                        Text("ser")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(width: 40, height: 25)
                            .background(appState.error == .server ? Color.red : Color.gray.opacity(0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }

                    Button {
                        appState.error = appState.error == .noInternet ? nil : .noInternet
                    } label: {
                        Text("net")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(width: 40, height: 25)
                            .background(appState.error == .noInternet ? Color.red : Color.gray.opacity(0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.bottom, 100)
                .padding(.trailing, 16)
            }
            #endif
    }
}

extension View {
    func errorOverlay() -> some View {
        modifier(ErrorOverlay())
    }
}
