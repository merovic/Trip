// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let logins = try? newJSONDecoder().decode(Logins.self, from: jsonData)

import Foundation

// MARK: - Login
struct Login: Codable {
    let id: Int
    let name, email, password, address: String
    let license, rate, datee, phone: String
    let img: String?
    
}
