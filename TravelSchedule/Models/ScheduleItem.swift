import Foundation

struct ScheduleItem: Identifiable {
    let id = UUID()
    let carrier: String
    let departureTime: String
    let arrivalTime: String
    let duration: String
    let transferCity: String?
    let date: String
}
