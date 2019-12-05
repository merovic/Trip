//
//  Constants.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 26/11/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import Foundation

struct K {
    struct ProductionServer {

        static let baseURL = "http://trip.technowow.net/triping.asmx"
    }
    
    struct forgete_password_by_email {
        static let email = "email"
    }
    
    struct agrre_refuse {
        static let id_request = "id_request"
    }
    
    struct agrre_request {
        static let id_request = "id_request"
        static let km = "km"
        
    }
    
    struct insert_car {
        static let id_owner = "id_owner"
        static let owner = "owner"
        static let image = "image"
        static let price_rent_per_day = "price_rent_per_day"
        static let available_date_from = "available_date_from"
        static let available_date_to = "available_date_to"
        static let number_km = "number_km"
        static let price_km = "price_km"
        static let price_trip = "price_trip"
        static let city = "city"
        static let area = "area"
        static let st_name = "st_name"
        static let number_hone = "number_hone"
        static let lon = "lon"
        static let lat = "lat"
        static let number_of_trip = "number_of_trip"
        static let model = "model"
        static let type = "type"
        static let rate = "rate"
    }
    
    struct insert_note_car {
        static let id_user = "id_user"
        static let id_owner = "id_owner"
        static let id_car = "id_car"
        static let title = "title"
        static let details = "details"
        static let datee = "datee"
              
    }
    
    struct insert_request_car {
        static let id_user = "id_user"
        static let id_owner = "id_owner"
        static let id_car = "id_car"
        static let message = "message"
        static let datee = "datee"
    }
    
    struct login_user {
           static let email = "email"
           static let password = "pass"
    }
    
    struct register {
        
        static let name = "name"
        static let email = "email"
        static let password = "password"
        static let phone = "phone"
        static let address = "address"
        static let license = "license"
        static let rate = "rate"
        
    }
    
    struct select_all_car_by_city {
        static let city = "city"
    }
    
    struct select_all_car_by_city_and_date {
        static let city = "city"
        static let available_date_from = "available_date_from"
        static let available_date_to = "available_date_to"
        
    }
    
    struct select_all_car_by_id {
        static let id = "id"
    }
    
    struct select_all_cars {
        static let number_of_select = "number_of_select"
    }
    
    struct select_all_cars_by_rate {
        static let number_of_select = "number_of_select"
    }
    
    struct select_note_by_id_owner {
        
        static let id_owner = "id_owner"

    }
    
    struct select_note_by_id_user {
        static let id_user = "id_user"
    }
    
    struct select_request_by_id_request {
        static let id_request = "id_request"
    }
    
    struct update_user {
        static let id_user = "id_user"
        static let name = "name"
        static let email = "email"
        static let password = "password"
        static let phone = "phone"
        static let address = "address"
        static let license = "license"
        static let img = "img"
    }
    
    struct delete_not {
        static let id = "id"
    }
    
    struct end_trip {
           static let id_request = "id_request"
        static let new_km = "new_km"
       }
    struct select_all_request_by_id_owner {
           static let id_owner = "id_owner"
       }
    struct select_all_request_by_id_user {
           static let id_user = "id_user"
       }
    struct select_request_that_have_aggree_by_id_owner {
           static let id_owner = "id_owner"
       }
    struct select_request_that_have_aggree_by_id_user {
           static let id_user = "id_user"
       }
    struct select_request_that_have_endtrip_by_id_owner {
        static let id_owner = "id_owner"
    }
    struct select_request_that_have_endtrip_by_id_user {
        static let id_user = "id_user"
    }
    struct select_request_that_have_starttrip_by_id_owner {
        static let id_owner = "id_owner"
    }
    struct select_request_that_have_starttrip_by_id_user {
        static let id_user = "id_user"
    }
    struct select_user_by_id {
        static let id_user = "id_user"
    }
    struct start_trip {
        static let id_request = "id_request"
        static let new_km = "new_km"
    }
    struct update_car_rate {
        static let id_car = "id_car"
        static let number_rate = "number_rate"
    }
    struct update_user_rate {
        static let id_user = "id_user"
        static let number_rate = "number_rate"
    }
    struct update_car {
        static let id_car = "id_car"
        static let id_owner = "id_owner"
        static let owner = "owner"
        static let image = "image"
        static let price_rent_per_day = "price_rent_per_day"
        static let available_date_from = "available_date_from"
        static let available_date_to = "available_date_to"
        static let number_km = "number_km"
        static let price_km = "price_km"
        static let price_trip = "price_trip"
        static let city = "city"
        static let area = "area"
        static let st_name = "st_name"
        static let number_hone = "number_hone"
        static let lon = "lon"
        static let lat = "lat"
        static let number_of_trip = "number_of_trip"
        static let model = "model"
        static let type = "type"
        static let rate = "rate"
    }
    
}



enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/x-www-form-urlencoded"
}
