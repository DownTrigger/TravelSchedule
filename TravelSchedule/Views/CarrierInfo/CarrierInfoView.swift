import SwiftUI

struct CarrierInfoView: View {
    let carrierName: String

    @StateObject private var viewModel: CarrierInfoViewModel

    init(carrier: String) {
        self.carrierName = carrier
        self._viewModel = StateObject(wrappedValue: CarrierInfoViewModel(name: carrier, service: MockScheduleService()))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("carrierLogoLarge")
                .resizable()
                .scaledToFit()
                .frame(height: 104)
                .frame(maxWidth: .infinity)
                .padding(.top, 16)
                .padding(.bottom, 16)

            Text("ОАО «\(carrierName)»")
                .font(.system(size: FontSize.large, weight: .bold))
                .foregroundStyle(Color("textPrimary"))
                .padding(.horizontal, 16)
                .padding(.bottom, 16)

            if let carrier = viewModel.carrier {
                VStack(alignment: .leading, spacing: 4) {
                    Text("E-mail")
                        .font(.system(size: FontSize.body))
                        .foregroundStyle(Color("textPrimary"))
                    Text(carrier.email)
                        .font(.system(size: FontSize.body))
                        .foregroundStyle(Color("tsBlue"))
                }
                .frame(height: 60, alignment: .center)
                .padding(.horizontal, 16)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Телефон")
                        .font(.system(size: FontSize.body))
                        .foregroundStyle(Color("textPrimary"))
                    Text(carrier.phone)
                        .font(.system(size: FontSize.body))
                        .foregroundStyle(Color("tsBlue"))
                }
                .frame(height: 60, alignment: .center)
                .padding(.horizontal, 16)
            }

            Spacer()
        }
        .navigationTitle("Информация о перевозчике")
        .navigationBarTitleDisplayMode(.inline)
        .customBackButton()
    }
}
