// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cars = try? newJSONDecoder().decode(Cars.self, from: jsonData)

import Foundation

// MARK: - Car
struct Car: Codable {
    let id, idOwner: Int
    let owner, image, priceRentPerDay: String
    let availableDateFrom: AvailableDateFrom
    let availableDateTo: AvailableDateTo
    let numberKM, priceKM, priceTrip, rate: String
    let city, area, stName, numberHone: String
    let lon, lat, numberOfTrip, model: String
    let type: String
    let datee: JSONNull?

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

enum AvailableDateFrom: String, Codable {
    case date1573714800000 = "/Date(1573714800000)/"
}

enum AvailableDateTo: String, Codable {
    case date1575010800000 = "/Date(1575010800000)/"
}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
