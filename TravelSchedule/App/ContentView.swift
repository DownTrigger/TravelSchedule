import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: Icons.scheduleTab)
                }

            SettingsView()
                .tabItem {
                    Image(systemName: Icons.settingsTab)
                }
        }
        .errorOverlay()
    }
}

#Preview {
    ContentView()
}
