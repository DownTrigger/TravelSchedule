import SwiftUI

struct FilterView: View {
    @Binding var filtersApplied: Bool
    @Binding var selectedTimes: Set<DepartureTime>
    @Binding var showTransfers: Bool?
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Время отправления")
                .font(.system(size: FontSize.large, weight: .bold))
                .foregroundStyle(Color("textPrimary"))
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 16)

            ForEach(DepartureTime.allCases) { time in
                HStack {
                    Text(time.label)
                        .foregroundStyle(Color("textPrimary"))
                    Spacer()
                    Image(systemName: selectedTimes.contains(time) ? Icons.checkboxOn : Icons.checkboxOff)
                        .foregroundStyle(selectedTimes.contains(time) ? Color("textPrimary") : Color("tsGray"))
                        .font(.system(size: 20))
                }
                .frame(height: 60)
                .contentShape(Rectangle())
                .onTapGesture {
                    if selectedTimes.contains(time) {
                        selectedTimes.remove(time)
                    } else {
                        selectedTimes.insert(time)
                    }
                }
                .padding(.horizontal, 16)
            }

            Text("Показывать варианты с пересадками")
                .font(.system(size: FontSize.large, weight: .bold))
                .foregroundStyle(Color("textPrimary"))
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 16)

            HStack {
                Text("Да")
                    .foregroundStyle(Color("textPrimary"))
                Spacer()
                Image(systemName: showTransfers == true ? Icons.radioOn : Icons.radioOff)
                    .foregroundStyle(showTransfers == true ? Color("textPrimary") : Color("tsGray"))
                    .font(.system(size: 20))
            }
            .frame(height: 60)
            .contentShape(Rectangle())
            .onTapGesture { showTransfers = true }
            .padding(.horizontal, 16)

            HStack {
                Text("Нет")
                    .foregroundStyle(Color("textPrimary"))
                Spacer()
                Image(systemName: showTransfers == false ? Icons.radioOn : Icons.radioOff)
                    .foregroundStyle(showTransfers == false ? Color("textPrimary") : Color("tsGray"))
                    .font(.system(size: 20))
            }
            .frame(height: 60)
            .contentShape(Rectangle())
            .onTapGesture { showTransfers = false }
            .padding(.horizontal, 16)

            Spacer()

            if !selectedTimes.isEmpty && showTransfers != nil {
                Button {
                    filtersApplied = true
                    dismiss()
                } label: {
                    Text("Применить")
                        .font(.system(size: FontSize.body, weight: .bold))
                        .foregroundStyle(Color("tsWhite"))
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color("tsBlue"))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(16)
            }
        }
        .background(Color("background"))
        .navigationTitle("")
        .customBackButton()
    }
}
