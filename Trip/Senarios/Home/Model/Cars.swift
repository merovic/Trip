// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let logins = try? newJSONDecoder().decode(Logins.self, from: jsonData)

import Foundation

// MARK: - Login
struct Car: Codable {
    let id, idOwner: Int
    let owner, image, priceRentPerDay, availableDateFrom: String
    let availableDateTo, numberKM, priceKM, priceTrip: String
    let rate, city, area, stName: String
    let numberHone, lon, lat, numberOfTrip: String
    let model, type: String
    let datee: String?

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
    }
}

