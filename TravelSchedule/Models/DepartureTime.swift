enum DepartureTime: String, CaseIterable, Identifiable {
    case morning, day, evening, night
    var id: Self { self }
    var label: String {
        switch self {
        case .morning: return "Утро 06:00 - 12:00"
        case .day: return "День 12:00 - 18:00"
        case .evening: return "Вечер 18:00 - 00:00"
        case .night: return "Ночь 00:00 - 06:00"
        }
    }
}
