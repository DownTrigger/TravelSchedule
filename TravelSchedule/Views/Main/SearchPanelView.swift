import SwiftUI

struct SearchPanelView: View {
    @Binding var fromCity: String
    @Binding var toCity: String
    let onFromTap: () -> Void
    let onToTap: () -> Void
    let onSearch: () -> Void

    private var canSearch: Bool { !fromCity.isEmpty && !toCity.isEmpty }

    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                VStack(spacing: 0) {
                    Button(action: onFromTap) {
                        HStack {
                            Text(fromCity.isEmpty ? "Откуда" : fromCity)
                                .foregroundStyle(fromCity.isEmpty ? Color("tsGray") : Color("tsBlack"))
                                .lineLimit(1)
                                .truncationMode(.tail)
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        .frame(height: 48)
                    }

                    Button(action: onToTap) {
                        HStack {
                            Text(toCity.isEmpty ? "Куда" : toCity)
                                .foregroundStyle(toCity.isEmpty ? Color("tsGray") : Color("tsBlack"))
                                .lineLimit(1)
                                .truncationMode(.tail)
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        .frame(height: 48)
                    }
                }
                .background(Color("tsWhite"))
                .clipShape(RoundedRectangle(cornerRadius: 20))

                Button {
                    let tmp = fromCity
                    fromCity = toCity
                    toCity = tmp
                } label: {
                    Image(systemName: Icons.swap)
                        .font(.system(size: 20))
                        .foregroundStyle(Color("tsBlue"))
                        .frame(width: 36, height: 36)
                        .background(Color("tsWhite"))
                        .clipShape(Circle())
                }
            }
            .padding(16)
            .background(Color("tsBlue"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, 16)

            if canSearch {
                Button(action: onSearch) {
                    Text("Найти")
                        .font(.system(size: FontSize.body, weight: .bold))
                        .foregroundStyle(Color("tsWhite"))
                        .frame(width: 150, height: 60)
                        .background(Color("tsBlue"))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
        }
    }
}
