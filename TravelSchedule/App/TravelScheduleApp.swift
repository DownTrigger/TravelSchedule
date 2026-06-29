import SwiftUI

@main
struct TravelScheduleApp: App {
    @State private var showSplash = true

    init() {
        let normalColor = UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(named: "tsGray") ?? .systemGray
                : UIColor(named: "tsGray") ?? .systemGray
        }
        let selectedColor = UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? .white
                : .black
        }

        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = normalColor
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = selectedColor
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }

    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            showSplash = false
                        }
                    }
            } else {
                ContentView()
                    .environmentObject(appState)
            }
        }
    }
}
