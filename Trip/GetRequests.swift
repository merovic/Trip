// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getRequests = try? newJSONDecoder().decode(GetRequests.self, from: jsonData)

import Foundation

// MARK: - GetRequest
struct GetRequest: Codable {
    let id, idUser, idOwner, idCar: Int
    let message, datee, agrreOrRefuse, kmAgree: String
    let id1, idOwner1: Int
    let owner, image, priceRentPerDay, availableDateFrom: String
    let availableDateTo, numberKM, priceKM, priceTrip: String
    let rate, city, area, stName: String
    let numberHone, lon, lat, numberOfTrip: String
    let model, type: String
    let datee1: JSONNull?
    let id2: Int
    let name, email, password, address: String
    let license, rate1, datee2, phone: String

    enum CodingKeys: String, CodingKey {
        case id
        case idUser = "id_user"
        case idOwner = "id_owner"
        case idCar = "id_car"
        case message, datee
        case agrreOrRefuse = "agrre_or_refuse"
        case kmAgree = "km_agree"
        case id1
        case idOwner1 = "id_owner1"
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
        case datee1 = "Datee1"
        case id2, name, email, password, address, license, rate1, datee2, phone
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
