import OpenAPIRuntime
import Foundation
import OpenAPIURLSession

typealias AllStations = Components.Schemas.AllStationsResponse

protocol AllStationsServiceProtocol {
    func getAllStations() async throws -> AllStations
}

final class AllStationsService: AllStationsServiceProtocol {
    private let client: Client

    init(client: Client) {
        self.client = client
    }

    func getAllStations() async throws -> AllStations {
        let response = try await client.getAllStations(query: .init())
        let responseBody = try response.ok.body.html
        let limit = 50 * 1024 * 1024
        let fullData = try await Data(collecting: responseBody, upTo: limit)
        return try JSONDecoder().decode(AllStations.self, from: fullData)
    }
}
