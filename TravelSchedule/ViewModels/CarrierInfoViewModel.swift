import Foundation

final class CarrierInfoViewModel: ObservableObject {
    @Published var carrier: Carrier?

    init(name: String, service: ScheduleServiceProtocol) {
        self.carrier = service.getCarrierInfo(name: name)
    }
}
