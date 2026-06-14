// TODO: Временный файл

import OpenAPIRuntime
import OpenAPIURLSession

private enum TestConstants {
    static let spbLat: Double = 59.864177
    static let spbLng: Double = 30.319163
    static let nearbyDistance: Int = 50
    static let spbCode = "c2"
    static let moscowCode = "c213"
    static let pulkovoStation = "s9600213"
    static let aeroflotCode = "SU"
    static let iataSystem = "iata"
}

private func makeClient() throws -> Client {
    Client(
        serverURL: try Servers.Server1.url(),
        transport: URLSessionTransport(),
        middlewares: [AuthMiddleware()]
    )
}

func testFetchStations() {
    Task {
        do {
            let service = NearestStationsService(client: try makeClient())
            let stations = try await service.getNearestStations(
                lat: TestConstants.spbLat,
                lng: TestConstants.spbLng,
                distance: TestConstants.nearbyDistance
            )
            print("[OK] NearestStations: \(stations.stations?.count ?? 0) станций")
        } catch {
            print("[FAIL] NearestStations: \(error)")
        }
    }
}

func testFetchScheduleBetweenStations() {
    Task {
        do {
            let service = ScheduleBetweenStationsService(client: try makeClient())
            let schedule = try await service.getScheduleBetweenStations(
                from: TestConstants.spbCode,
                to: TestConstants.moscowCode
            )
            print("[OK] ScheduleBetweenStations: \(schedule.segments?.count ?? 0) сегментов")
        } catch {
            print("[FAIL] ScheduleBetweenStations: \(error)")
        }
    }
}

func testFetchStationSchedule() {
    Task {
        do {
            let service = StationScheduleService(client: try makeClient())
            let schedule = try await service.getStationSchedule(station: TestConstants.pulkovoStation)
            print("[OK] StationSchedule: \(schedule.schedule?.count ?? 0) записей")
        } catch {
            print("[FAIL] StationSchedule: \(error)")
        }
    }
}

func testFetchRouteStations() {
    Task {
        do {
            let client = try makeClient()
            let searchService = ScheduleBetweenStationsService(client: client)
            let schedule = try await searchService.getScheduleBetweenStations(
                from: TestConstants.spbCode,
                to: TestConstants.moscowCode
            )
            guard let uid = schedule.segments?.first?.thread?.uid else {
                print("[FAIL] RouteStations: не удалось получить uid из расписания")
                return
            }
            let service = RouteStationsService(client: client)
            let route = try await service.getRouteStations(uid: uid)
            print("[OK] RouteStations: \(route.stops?.count ?? 0) остановок")
        } catch {
            print("[FAIL] RouteStations: \(error)")
        }
    }
}

func testFetchNearestCity() {
    Task {
        do {
            let service = NearestCityService(client: try makeClient())
            let city = try await service.getNearestCity(
                lat: TestConstants.spbLat,
                lng: TestConstants.spbLng
            )
            print("[OK] NearestCity: \(city.title ?? "no title")")
        } catch {
            print("[FAIL] NearestCity: \(error)")
        }
    }
}

func testFetchCarrierInfo() {
    Task {
        do {
            let service = CarrierInfoService(client: try makeClient())
            let carrier = try await service.getCarrierInfo(code: TestConstants.aeroflotCode, system: TestConstants.iataSystem)
            print("[OK] CarrierInfo: \(carrier.carrier?.title ?? "no title")")
        } catch {
            print("[FAIL] CarrierInfo: \(error)")
        }
    }
}

func testFetchAllStations() {
    Task {
        do {
            let service = AllStationsService(client: try makeClient())
            let stations = try await service.getAllStations()
            print("[OK] AllStations: \(stations.countries?.count ?? 0) стран")
        } catch {
            print("[FAIL] AllStations: \(error)")
        }
    }
}

func testFetchCopyright() {
    Task {
        do {
            let service = CopyrightService(client: try makeClient())
            let copyright = try await service.getCopyright()
            print("[OK] Copyright: \(copyright.copyright?.text ?? "no text")")
        } catch {
            print("[FAIL] Copyright: \(error)")
        }
    }
}
