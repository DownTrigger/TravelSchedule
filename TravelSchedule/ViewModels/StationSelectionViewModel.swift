import Foundation

final class StationSelectionViewModel: ObservableObject {
    @Published var query = ""

    private let service: ScheduleServiceProtocol
    private let allStations: [String]

    var filtered: [String] {
        query.isEmpty ? allStations : allStations.filter { $0.localizedCaseInsensitiveContains(query) }
    }

    init(city: String, service: ScheduleServiceProtocol) {
        self.service = service
        self.allStations = service.getStations(for: city)
    }
}
