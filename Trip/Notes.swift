// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let notes = try? newJSONDecoder().decode(Notes.self, from: jsonData)

import Foundation

// MARK: - Note
struct Note: Codable {
    let id, idUser, idOnwer, idCar: Int
    let title, datee, details: String

    enum CodingKeys: String, CodingKey {
        case id
        case idUser = "id_user"
        case idOnwer = "id_onwer"
        case idCar = "id_car"
        case title, datee, details
    }
}
