import Foundation

final class ScheduleViewModel: ObservableObject {
    @Published var filtersApplied = false
    @Published var selectedTimes: Set<DepartureTime> = []
    @Published var showTransfers: Bool? = nil

    private let allItems: [ScheduleItem]

    var filteredItems: [ScheduleItem] {
        guard filtersApplied else { return allItems }
        return allItems.filter { item in
            let timeMatch = selectedTimes.isEmpty || selectedTimes.contains(where: { $0.matches(item.departureTime) })
            let transferMatch = showTransfers == nil || showTransfers == (item.transferCity != nil)
            return timeMatch && transferMatch
        }
    }

    init(from: String, to: String, service: ScheduleServiceProtocol) {
        self.allItems = service.getSchedule(from: from, to: to)
    }
}

private extension DepartureTime {
    func matches(_ time: String) -> Bool {
        guard let hour = Int(time.prefix(2)) else { return false }
        switch self {
        case .morning: return hour >= 6 && hour < 12
        case .day:     return hour >= 12 && hour < 18
        case .evening: return hour >= 18 && hour < 24
        case .night:   return hour >= 0 && hour < 6
        }
    }
}
