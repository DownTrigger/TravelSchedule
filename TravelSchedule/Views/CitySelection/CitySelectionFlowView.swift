import SwiftUI

struct CitySelectionFlowView: View {
    let direction: CityDirection
    @Binding var fromCity: String
    @Binding var toCity: String
    @Binding var isPresented: Bool

    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            CitySelectionView(
                direction: direction,
                fromCity: $fromCity,
                toCity: $toCity,
                isPresented: $isPresented,
                path: $path
            )
            .navigationDestination(for: String.self) { city in
                StationSelectionView(
                    city: city,
                    direction: direction,
                    fromCity: $fromCity,
                    toCity: $toCity,
                    isPresented: $isPresented
                )
            }
        }
    }
}
