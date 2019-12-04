// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let requestAgrees = try? newJSONDecoder().decode(RequestAgrees.self, from: jsonData)

import Foundation

// MARK: - RequestAgree
struct RequestAgree: Codable {
    let id, idUser, idOwner, idCar: Int
    let message, datee, agrreOrRefuse, kmAgree: String

    enum CodingKeys: String, CodingKey {
        case id
        case idUser = "id_user"
        case idOwner = "id_owner"
        case idCar = "id_car"
        case message, datee
        case agrreOrRefuse = "agrre_or_refuse"
        case kmAgree = "km_agree"
    }
}
