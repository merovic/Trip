// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cars = try? newJSONDecoder().decode(Cars.self, from: jsonData)

import Foundation

// MARK: - Car
struct Car: Codable {
    let id, idOwner: Int
    let owner: String
    let image: String
    let priceRentPerDay, availableDateFrom, availableDateTo, numberKM: String
    let priceKM, priceTrip, rate, city: String
    let area, stName, numberHone, lon: String
    let lat, numberOfTrip, model, type: String
    let datee, tax, priceincresskilo, timing: String
    let availableTimeFrom, availableTimeTo: [String: Double]

    enum CodingKeys: String, CodingKey {
        case id
        case idOwner = "id_owner"
        case owner, image
        case priceRentPerDay = "price_rent_per_day"
        case availableDateFrom = "available_date_from"
        case availableDateTo = "available_date_to"
        case numberKM = "number_km"
        case priceKM = "price_km"
        case priceTrip = "price_trip"
        case rate, city, area
        case stName = "st_name"
        case numberHone = "number_hone"
        case lon, lat
        case numberOfTrip = "number_of_trip"
        case model, type
        case datee = "Datee"
        case tax, priceincresskilo, timing
        case availableTimeFrom = "available_time_from"
        case availableTimeTo = "available_time_to"
    }
}
