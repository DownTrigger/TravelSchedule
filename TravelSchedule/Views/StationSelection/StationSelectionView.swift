import SwiftUI

struct StationSelectionView: View {
    let city: String
    let direction: CityDirection
    @Binding var fromCity: String
    @Binding var toCity: String
    @Binding var isPresented: Bool

    @StateObject private var viewModel: StationSelectionViewModel

    init(city: String, direction: CityDirection, fromCity: Binding<String>, toCity: Binding<String>, isPresented: Binding<Bool>) {
        self.city = city
        self.direction = direction
        self._fromCity = fromCity
        self._toCity = toCity
        self._isPresented = isPresented
        self._viewModel = StateObject(wrappedValue: StationSelectionViewModel(city: city, service: MockScheduleService()))
    }

    var body: some View {
        VStack(spacing: 0) {
            SearchBarView(query: $viewModel.query, placeholder: "Введите запрос")
                .padding(.horizontal, 16)
                .padding(.vertical, 8)

            if viewModel.filtered.isEmpty {
                Spacer()
                Text("Станция не найдена")
                    .font(.system(size: FontSize.large, weight: .bold))
                    .foregroundStyle(Color("textPrimary"))
                Spacer()
            } else {
                List(viewModel.filtered, id: \.self) { station in
                    Button {
                        selectStation(station)
                    } label: {
                        HStack {
                            Text(station)
                                .foregroundStyle(.primary)
                            Spacer()
                            Image(systemName: Icons.chevronRight)
                                .font(.system(size: FontSize.body, weight: .semibold))
                                .foregroundStyle(.primary)
                        }
                        .frame(height: 60)
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Выбор станции")
        .navigationBarTitleDisplayMode(.inline)
        .customBackButton()
    }

    private func selectStation(_ station: String) {
        let value = "\(city) (\(station))"
        switch direction {
        case .from: fromCity = value
        case .to: toCity = value
        }
        isPresented = false
    }
}
