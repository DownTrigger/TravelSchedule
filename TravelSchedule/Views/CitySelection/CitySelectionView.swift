import SwiftUI

struct CitySelectionView: View {
    let direction: CityDirection
    @Binding var fromCity: String
    @Binding var toCity: String
    @Binding var isPresented: Bool
    @Binding var path: NavigationPath

    @StateObject private var viewModel = CitySelectionViewModel(service: MockScheduleService())

    var body: some View {
        VStack(spacing: 0) {
            SearchBarView(query: $viewModel.query, placeholder: "Введите запрос")
                .padding(.horizontal, 16)
                .padding(.vertical, 8)

            if viewModel.filtered.isEmpty {
                Spacer()
                Text("Город не найден")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            } else {
                List(viewModel.filtered, id: \.self) { city in
                    Button {
                        path.append(city)
                    } label: {
                        HStack {
                            Text(city)
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
        .navigationTitle("Выбор города")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    isPresented = false
                } label: {
                    Image(systemName: Icons.chevronLeft)
                        .foregroundStyle(Color("textPrimary"))
                }
            }
        }
    }
}
