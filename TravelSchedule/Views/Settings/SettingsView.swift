import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var showAgreement = false

    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: 24)
            Toggle("Темная тема", isOn: $isDarkMode)
                .tint(Color("tsBlue"))
                .padding(.horizontal, 16)
                .frame(height: 60)

            Button {
                showAgreement = true
            } label: {
                HStack {
                    Text("Пользовательское соглашение")
                        .foregroundStyle(Color("textPrimary"))
                    Spacer()
                    Image(systemName: Icons.chevronRight)
                        .font(.system(size: FontSize.body, weight: .semibold))
                        .foregroundStyle(Color("textPrimary"))
                }
                .padding(.horizontal, 16)
                .frame(height: 60)
            }

            Spacer()

            VStack(spacing: 4) {
                Text("Приложение использует API «Яндекс.Расписания»")
                    .font(.system(size: 12))
                    .foregroundStyle(Color("tsGray"))
                    .multilineTextAlignment(.center)
                Text("Версия 1.0 (beta)")
                    .font(.system(size: 12))
                    .foregroundStyle(Color("tsGray"))
            }
            .padding(.bottom, 16)
        }
        .fullScreenCover(isPresented: $showAgreement) {
            NavigationStack {
                UserAgreementView()
            }
        }
    }
}
