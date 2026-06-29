protocol ScheduleServiceProtocol {
    func getCities() -> [String]
    func getStations(for city: String) -> [String]
    func getSchedule(from: String, to: String) -> [ScheduleItem]
    func getCarrierInfo(name: String) -> Carrier?
    func getUserAgreementText() -> String
    func getStories() -> [Story]
}
