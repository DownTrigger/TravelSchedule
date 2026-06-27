import SwiftUI

struct ScheduleRowView: View {
    let item: ScheduleItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 8) {
                Image("carrierLogoSmall")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 38, height: 38)
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                VStack(alignment: .leading, spacing: 2) {
                    Text(item.carrier)
                        .font(.system(size: FontSize.body))
                        .foregroundStyle(Color("tsBlack"))
                    if let transfer = item.transferCity {
                        Text("С пересадкой в \(transfer)")
                            .font(.system(size: FontSize.caption))
                            .foregroundStyle(Color("tsRed"))
                    }
                }

                Spacer()

                Text(item.date)
                    .font(.system(size: FontSize.caption))
                    .foregroundStyle(Color("tsGray"))
            }

            HStack(spacing: 4) {
                Text(item.departureTime)
                    .font(.system(size: FontSize.body))
                    .foregroundStyle(Color("tsBlack"))

                Rectangle()
                    .fill(Color("tsGray").opacity(0.4))
                    .frame(height: 1)

                Text(item.duration)
                    .font(.system(size: FontSize.caption))
                    .foregroundStyle(Color("tsGray"))
                    .fixedSize()

                Rectangle()
                    .fill(Color("tsGray").opacity(0.4))
                    .frame(height: 1)

                Text(item.arrivalTime)
                    .font(.system(size: FontSize.body))
                    .foregroundStyle(Color("tsBlack"))
            }
        }
        .padding(12)
        .background(Color("tsLightGray"))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
