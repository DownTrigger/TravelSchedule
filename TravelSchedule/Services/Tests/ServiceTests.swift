// TODO: Временный файл

import OpenAPIRuntime
import OpenAPIURLSession

func testFetchStations() {
    Task {
        do {
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            let service = NearestStationsService(
                client: client,
                apikey: Secrets.apiKey
            )
            let stations = try await service.getNearestStations(
                lat: 59.864177,
                lng: 30.319163,
                distance: 50
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
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            let service = ScheduleBetweenStationsService(
                client: client,
                apikey: Secrets.apiKey
            )
            let schedule = try await service.getScheduleBetweenStations(
                from: "c2",
                to: "c213"
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
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            let service = StationScheduleService(
                client: client,
                apikey: Secrets.apiKey
            )
            let schedule = try await service.getStationSchedule(station: "s9600213")
            print("[OK] StationSchedule: \(schedule.schedule?.count ?? 0) записей")
        } catch {
            print("[FAIL] StationSchedule: \(error)")
        }
    }
}

func testFetchRouteStations() {
    Task {
        do {
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            let searchService = ScheduleBetweenStationsService(
                client: client,
                apikey: Secrets.apiKey
            )
            let schedule = try await searchService.getScheduleBetweenStations(
                from: "c2",
                to: "c213"
            )
            guard let uid = schedule.segments?.first?.thread?.uid else {
                print("[FAIL] RouteStations: не удалось получить uid из расписания")
                return
            }
            let service = RouteStationsService(
                client: client,
                apikey: Secrets.apiKey
            )
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
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            let service = NearestCityService(
                client: client,
                apikey: Secrets.apiKey
            )
            let city = try await service.getNearestCity(
                lat: 59.864177,
                lng: 30.319163
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
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            let service = CarrierInfoService(
                client: client,
                apikey: Secrets.apiKey
            )
            let carrier = try await service.getCarrierInfo(code: "SU", system: "iata")
            print("[OK] CarrierInfo: \(carrier.carrier?.title ?? "no title")")
        } catch {
            print("[FAIL] CarrierInfo: \(error)")
        }
    }
}

func testFetchAllStations() {
    Task {
        do {
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            let service = AllStationsService(
                client: client,
                apikey: Secrets.apiKey
            )
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
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            let service = CopyrightService(
                client: client,
                apikey: Secrets.apiKey
            )
            let copyright = try await service.getCopyright()
            print("[OK] Copyright: \(copyright.copyright?.text ?? "no text")")
        } catch {
            print("[FAIL] Copyright: \(error)")
        }
    }
}
