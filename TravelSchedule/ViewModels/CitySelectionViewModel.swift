import Foundation

final class CitySelectionViewModel: ObservableObject {
    @Published var query = ""

    private let service: ScheduleServiceProtocol
    private let allCities: [String]

    var filtered: [String] {
        query.isEmpty ? allCities : allCities.filter { $0.localizedCaseInsensitiveContains(query) }
    }

    init(service: ScheduleServiceProtocol) {
        self.service = service
        self.allCities = service.getCities()
    }
}
