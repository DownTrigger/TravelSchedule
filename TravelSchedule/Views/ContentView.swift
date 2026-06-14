import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            testFetchStations()
            testFetchScheduleBetweenStations()
            testFetchStationSchedule()
            testFetchRouteStations()
            testFetchNearestCity()
            testFetchCarrierInfo()
            testFetchAllStations()
            testFetchCopyright()
        }
    }
}

#Preview {
    ContentView()
}
