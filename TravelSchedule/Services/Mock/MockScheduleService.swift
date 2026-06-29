struct MockScheduleService: ScheduleServiceProtocol {
    func getCities() -> [String] {
        ["Москва", "Санкт-Петербург", "Сочи", "Новосибирск", "Краснодар", "Казань", "Омск"]
    }

    func getStations(for city: String) -> [String] {
        ["Киевский вокзал", "Курский вокзал", "Ярославский вокзал",
         "Белорусский вокзал", "Савеловский вокзал", "Ленинградский вокзал"]
    }

    func getSchedule(from: String, to: String) -> [ScheduleItem] {
        [
            ScheduleItem(carrier: "РЖД", departureTime: "07:30", arrivalTime: "17:45", duration: "10 часов", transferCity: nil, date: "14 января"),
            ScheduleItem(carrier: "ВГК", departureTime: "09:00", arrivalTime: "21:30", duration: "12 часов", transferCity: "Кострома", date: "14 января"),
            ScheduleItem(carrier: "ТСЖ", departureTime: "13:15", arrivalTime: "06:00", duration: "16 часов", transferCity: "Ярославль", date: "14 января"),
            ScheduleItem(carrier: "РЖД", departureTime: "19:00", arrivalTime: "07:00", duration: "12 часов", transferCity: nil, date: "15 января"),
            ScheduleItem(carrier: "ВГК", departureTime: "22:30", arrivalTime: "08:15", duration: "9 часов", transferCity: "Кострома", date: "15 января"),
            ScheduleItem(carrier: "ТСЖ", departureTime: "01:00", arrivalTime: "14:00", duration: "13 часов", transferCity: nil, date: "15 января"),
        ]
    }

    func getCarrierInfo(name: String) -> Carrier? {
        Carrier(name: name, email: "email@mail.ru", phone: "+7 (999) 999-99-99")
    }

    func getStories() -> [Story] {
        [
            Story(title: "текст текст текст текст", description: "текст текст текст текст текст текст текст текст текст текст текст текст текст текст текст текст", color: .indigo),
            Story(title: "текст текст текст текст", description: "текст текст текст текст текст текст текст текст текст текст текст текст текст текст текст текст", color: .brown),
            Story(title: "текст текст текст текст", description: "текст текст текст текст текст текст текст текст текст текст текст текст текст текст текст текст", color: .teal),
        ]
    }

    func getUserAgreementText() -> String {
        """
        текст текст текст текст текст текст текст текст текст текст текст текст текст текст текст текст
        текст текст текст текст текст текст текст текст текст текст текст текст текст текст текст текст
        текст текст текст текст текст текст текст текст текст текст текст текст текст текст текст текст 
        """
    }
}
