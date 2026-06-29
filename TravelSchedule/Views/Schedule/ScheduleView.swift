import SwiftUI

struct ScheduleView: View {
    let from: String
    let to: String
    let onDismiss: () -> Void

    @StateObject private var viewModel: ScheduleViewModel
    @State private var showFilter = false
    @State private var selectedCarrier: String? = nil

    init(from: String, to: String, onDismiss: @escaping () -> Void) {
        self.from = from
        self.to = to
        self.onDismiss = onDismiss
        self._viewModel = StateObject(wrappedValue: ScheduleViewModel(from: from, to: to, service: MockScheduleService()))
    }

    var body: some View {
        VStack(spacing: 0) {
            Text("\(from) → \(to)")
                .font(.system(size: FontSize.large, weight: .bold))
                .foregroundStyle(Color("textPrimary"))
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity, alignment: .leading)

            ZStack(alignment: .bottom) {
                if viewModel.filteredItems.isEmpty {
                    Text("Вариантов нет")
                        .font(.system(size: FontSize.large, weight: .bold))
                        .foregroundStyle(Color("textPrimary"))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.bottom, 92)
                } else {
                    List {
                        ForEach(viewModel.filteredItems) { item in
                            Button {
                                selectedCarrier = item.carrier
                            } label: {
                                ScheduleRowView(item: item)
                            }
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                            .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                        }
                        Color.clear.frame(height: 92)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .background(Color("background"))
                }

                Button {
                    showFilter = true
                } label: {
                    HStack(spacing: 4) {
                        Text("Уточнить время")
                            .font(.system(size: FontSize.body, weight: .bold))
                            .foregroundStyle(Color("tsWhite"))
                        if viewModel.filtersApplied {
                            Circle()
                                .fill(Color("tsRed"))
                                .frame(width: 8, height: 8)
                        }
                    }
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color("tsBlue"))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(16)
            }
        }
        .background(Color("background"))
        .navigationDestination(isPresented: $showFilter) {
            FilterView(
                filtersApplied: $viewModel.filtersApplied,
                selectedTimes: $viewModel.selectedTimes,
                showTransfers: $viewModel.showTransfers
            )
        }
        .navigationDestination(item: $selectedCarrier) { carrier in
            CarrierInfoView(carrier: carrier)
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button { onDismiss() } label: {
                    Image(systemName: Icons.chevronLeft)
                        .foregroundStyle(Color("textPrimary"))
                }
            }
        }
    }
}

