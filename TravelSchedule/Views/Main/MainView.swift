import SwiftUI

struct MainView: View {
    @State private var fromCity: String = ""
    @State private var toCity: String = ""
    @State private var showStories = false
    @State private var showCityPicker = false
    @State private var scheduleRoute: ScheduleRoute? = nil
    @State private var cityPickerDirection: CityDirection = .from

    var body: some View {
        VStack(spacing: 20) {
            StoriesRowView(onTap: { showStories = true })

            SearchPanelView(
                fromCity: $fromCity,
                toCity: $toCity,
                onFromTap: {
                    cityPickerDirection = .from
                    showCityPicker = true
                },
                onToTap: {
                    cityPickerDirection = .to
                    showCityPicker = true
                },
                onSearch: {
                    scheduleRoute = ScheduleRoute(from: fromCity, to: toCity)
                }
            )

            Spacer()
        }
        .fullScreenCover(isPresented: $showCityPicker) {
            CitySelectionFlowView(
                direction: cityPickerDirection,
                fromCity: $fromCity,
                toCity: $toCity,
                isPresented: $showCityPicker
            )
        }
        .fullScreenCover(item: $scheduleRoute) { route in
            ScheduleFlowView(from: route.from, to: route.to)
        }
        .fullScreenCover(isPresented: $showStories) {
            StoriesView()
        }
    }
}

#Preview {
    MainView()
}
