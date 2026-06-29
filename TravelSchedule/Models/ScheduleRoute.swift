import Foundation

struct ScheduleRoute: Identifiable {
    let id = UUID()
    let from: String
    let to: String
}
