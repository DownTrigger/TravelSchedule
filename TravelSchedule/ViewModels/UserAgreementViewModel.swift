import Foundation

final class UserAgreementViewModel: ObservableObject {
    @Published var text: String

    init(service: ScheduleServiceProtocol) {
        self.text = service.getUserAgreementText()
    }
}
