import SwiftUI

struct ContentView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.colorScheme) private var colorScheme

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
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .onAppear {
            isDarkMode = colorScheme == .dark
        }
        .onChange(of: colorScheme) {
            isDarkMode = colorScheme == .dark
        }
    }
}

#Preview {
    ContentView()
}
