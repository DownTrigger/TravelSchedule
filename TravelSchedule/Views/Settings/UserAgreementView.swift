import SwiftUI

struct UserAgreementView: View {
    @StateObject private var viewModel = UserAgreementViewModel(service: MockScheduleService())

    var body: some View {
        ScrollView {
            Text(viewModel.text)
                .padding(16)
        }
        .background(Color("background"))
        .navigationTitle("Пользовательское соглашение")
        .navigationBarTitleDisplayMode(.inline)
        .customBackButton()
    }
}
