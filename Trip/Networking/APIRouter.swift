//
//  APIRouter.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 26/11/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case agrre_refuse(id_request:Int)
    case forgete_password_by_email(email:String)
    case agrre_request(id_request: Int ,km: Int)
    case insert_car( id_owner : Int ,owner : String ,image:String,price_rent_per_day : String ,available_date_from : String ,available_date_to : String ,number_km : String ,price_km : String ,price_trip: String ,city : String,area : String,st_name : String,number_hone : String,lon : String,lat : String,number_of_trip : String,model : String,type : String,rate : String)
    case insert_note_car(id_user:Int ,id_owner:Int , id_car:Int , title:String , details:String , datee:String)
    case insert_request_car(id_user:Int ,id_owner:Int , id_car:Int , message:String , datee:String)
    case login_user(email:String, pass:String)
    case register( name : String ,email : String ,password:String,phone : String ,address : String ,license : String ,rate : String )
    case select_all_car_by_city(city : String)
    case select_all_car_by_city_and_date(city: String ,available_date_from: String , available_date_to: String)
    case select_all_car_by_id(id : Int)
    case select_all_cars(number_of_select : Int)
    case select_all_cars_by_rate (number_of_select : Int)
    case select_note_by_id_owner(id_owner : Int)
    case select_note_by_id_user(id_user : Int)
    case select_request_by_id_request (id_request : Int)
    case update_user (id_user: Int ,name: String ,
        email : String , password: String , phone: String ,address: String ,license: String ,img: String)
    case delete_not(id: Int)
    case end_trip(id_request: Int , new_km: Double)
    case select_all_request_by_id_owner(id_owner: Int)
    case select_all_request_by_id_user(id_user: Int)
    case select_request_that_have_aggree_by_id_owner (id_owner: Int)
    case select_request_that_have_aggree_by_id_user(id_user: Int)
    case select_request_that_have_endtrip_by_id_owner(id_owner: Int)
    case select_request_that_have_endtrip_by_id_user(id_user: Int)
    case select_request_that_have_starttrip_by_id_owner(id_owner: Int)
    case select_request_that_have_starttrip_by_id_user(id_user: Int)
    case select_user_by_id(id_user: Int)
    case start_trip(id_request: Int , new_km: Double)
    case update_car_rate(id_car: Int , number_rate: Double)
    case update_user_rate(id_user: Int , number_rate: Double)
    case update_car( id_car: Int ,id_owner : Int ,owner : String ,image:String,price_rent_per_day : String ,available_date_from : String ,available_date_to : String ,number_km : String ,price_km : String ,price_trip: String ,city : String,area : String,st_name : String,number_hone : String,lon : String,lat : String,number_of_trip : String,model : String,type : String,rate : String)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
            
        case .agrre_refuse:
            return .get
        case .forgete_password_by_email:
            return .get
        case .agrre_request:
            return .get
        case .insert_car:
            return .get
        case .insert_note_car:
            return .get
        case .insert_request_car:
            return .get
        case .login_user:
            return .get
        case .register:
            return .get
        case .select_all_car_by_city:
            return .get
        case .select_all_car_by_city_and_date:
            return .get
        case .select_all_car_by_id:
            return .get
        case .select_all_cars:
            return .get
        case .select_all_cars_by_rate:
            return .get
        case .select_note_by_id_owner:
            return .get
        case .select_note_by_id_user:
            return .get
        case .select_request_by_id_request:
            return .get
        case .update_user:
            return .get
        case .delete_not:
            return .get
        case .end_trip:
            return .get
        case .select_all_request_by_id_owner:
            return .get
        case .select_all_request_by_id_user:
            return .get
        case .select_request_that_have_aggree_by_id_owner:
            return .get
        case .select_request_that_have_aggree_by_id_user:
            return .get
        case .select_request_that_have_endtrip_by_id_owner:
            return .get
        case .select_request_that_have_endtrip_by_id_user:
            return .get
        case .select_request_that_have_starttrip_by_id_owner:
            return .get
        case .select_request_that_have_starttrip_by_id_user:
            return .get
        case .select_user_by_id:
            return .get
        case .start_trip:
            return .get
        case .update_car_rate:
            return .get
        case .update_user_rate:
            return .get
        case .update_car:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
            
        case .agrre_refuse:
            return "/agrre_refuse"
        case .forgete_password_by_email:
            return "/forgete_password_by_email"
        case .agrre_request:
            return "/agrre_request"
        case .insert_car:
            return "/insert_car"
        case .insert_note_car:
            return "/insert_note_car"
        case .insert_request_car:
            return "/insert_request_car"
        case .login_user:
            return "/login_user"
        case .register:
            return "/register"
        case .select_all_car_by_city:
            return "/select_all_car_by_city"
        case .select_all_car_by_city_and_date:
            return "/select_all_car_by_city_and_date"
        case .select_all_car_by_id:
            return "/select_all_car_by_id"
        case .select_all_cars:
            return "/select_all_cars"
        case .select_all_cars_by_rate:
            return "/select_all_cars_by_rate"
        case .select_note_by_id_owner:
            return "/select_note_by_id_owner"
        case .select_note_by_id_user:
            return "/select_note_by_id_user"
        case .select_request_by_id_request:
            return "/select_request_by_id_owner"
        case .update_user:
            return "/update_user"
        case .delete_not:
            return "/delete_not"
        case .end_trip:
            return "/end_trip"
        case .select_all_request_by_id_owner:
            return "/select_all_request_by_id_owner"
        case .select_all_request_by_id_user:
            return "/select_all_request_by_id_user"
        case .select_request_that_have_aggree_by_id_owner:
            return "/login_user"
        case .select_request_that_have_aggree_by_id_user:
            return "/select_request_that_have_aggree_by_id_user"
        case .select_request_that_have_endtrip_by_id_owner:
            return "/select_request_that_have_endtrip_by_id_owner"
        case .select_request_that_have_endtrip_by_id_user:
            return "/select_request_that_have_endtrip_by_id_user"
        case .select_request_that_have_starttrip_by_id_owner:
            return "/select_request_that_have_starttrip_by_id_owner"
        case .select_request_that_have_starttrip_by_id_user:
            return "/select_request_that_have_starttrip_by_id_user"
        case .select_user_by_id:
            return "/select_user_by_id"
        case .start_trip:
            return "/start_trip"
        case .update_car_rate:
            return "/update_car_rate"
        case .update_user_rate:
            return "/update_user_rate"
        case .update_car:
            return "/update_car"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
            
        case .agrre_refuse(let id_request):
            return [K.agrre_refuse.id_request: id_request]
        case .forgete_password_by_email(let email):
            return [K.forgete_password_by_email.email: email]
        case .agrre_request(let id_request, let km):
            return [K.agrre_request.id_request: id_request , K.agrre_request.km: km]
        case .insert_car(let id_owner, let owner, let image, let price_rent_per_day, let available_date_from, let available_date_to, let number_km, let price_km, let price_trip, let city, let area, let st_name, let number_hone, let lon, let lat, let number_of_trip, let model, let type, let rate):
            return [K.insert_car.id_owner: id_owner ,K.insert_car.owner: owner ,K.insert_car.image: image ,K.insert_car.price_rent_per_day: price_rent_per_day ,K.insert_car.available_date_from: available_date_from ,K.insert_car.available_date_to: available_date_to ,K.insert_car.number_km: number_km ,K.insert_car.price_km: price_km ,K.insert_car.price_trip: price_trip ,K.insert_car.city: city ,K.insert_car.area: area ,K.insert_car.st_name: st_name ,K.insert_car.number_hone: number_hone ,K.insert_car.lon: lon ,K.insert_car.lat: lat ,K.insert_car.number_of_trip: number_of_trip ,K.insert_car.model: model ,K.insert_car.type: type ,K.insert_car.rate: rate]
        case .insert_note_car(let id_user, let id_owner, let id_car, let title, let details, let datee):
            return [K.insert_note_car.id_user: id_user ,K.insert_note_car.id_owner: id_owner ,K.insert_note_car.id_car: id_car ,K.insert_note_car.title: title , K.insert_note_car.details: details ,K.insert_note_car.datee: datee]
        case .insert_request_car(let id_user, let id_owner, let id_car, let message, let datee):
            return [K.insert_request_car.id_user: id_user ,K.insert_request_car.id_owner: id_owner ,K.insert_request_car.id_car: id_car ,K.insert_request_car.message: message ,K.insert_request_car.datee: datee]
        case .login_user(let email, let pass):
            return [K.login_user.email: email,K.login_user.password:pass]
        case .register(let name, let email, let password, let phone, let address, let license, let rate):
            return [K.register.name: name ,K.register.email:email ,K.register.password:password ,K.register.phone: phone, K.register.address: address ,K.register.license: license ,K.register.rate: rate]
        case .select_all_car_by_city(let city):
            return [K.select_all_car_by_city.city: city]
        case .select_all_car_by_city_and_date(let city, let available_date_from, let available_date_to):
            return [K.select_all_car_by_city_and_date.city: city ,K.select_all_car_by_city_and_date.available_date_from: available_date_from ,K.select_all_car_by_city_and_date.available_date_to: available_date_to]
        case .select_all_car_by_id(let id):
            return [K.select_all_car_by_id.id: id]
        case .select_all_cars(let number_of_select):
            return [K.select_all_cars.number_of_select: number_of_select]
        case .select_all_cars_by_rate(let number_of_select):
            return [K.select_all_cars_by_rate.number_of_select: number_of_select]
        case .select_note_by_id_owner(let id_owner):
            return [K.select_note_by_id_owner.id_owner: id_owner]
        case .select_note_by_id_user(let id_user):
            return [K.select_note_by_id_user.id_user: id_user]
        case .select_request_by_id_request(let id_request):
            return [K.select_request_by_id_request.id_request: id_request]
        case .delete_not(let id):
            return [K.delete_not.id: id]
        case .end_trip(let id_request, let new_km):
            return[K.end_trip.id_request: id_request ,K.end_trip.new_km: new_km]
        case .select_all_request_by_id_owner(let id_owner):
            return [K.select_all_request_by_id_owner.id_owner: id_owner]
        case .select_all_request_by_id_user(let id_user):
            return [K.select_all_request_by_id_user.id_user: id_user]
        case .select_request_that_have_aggree_by_id_owner(let id_owner):
            return [K.select_request_that_have_aggree_by_id_owner.id_owner: id_owner]
        case .select_request_that_have_aggree_by_id_user(let id_user):
            return [K.select_request_that_have_aggree_by_id_user.id_user: id_user]
        case .select_request_that_have_endtrip_by_id_owner(let id_owner):
            return [K.select_request_that_have_endtrip_by_id_owner.id_owner: id_owner]
        case .select_request_that_have_endtrip_by_id_user(let id_user):
            return [K.select_request_that_have_endtrip_by_id_user.id_user: id_user]
        case .select_request_that_have_starttrip_by_id_owner(let id_owner):
            return [K.select_request_that_have_starttrip_by_id_owner.id_owner: id_owner]
        case .select_request_that_have_starttrip_by_id_user(let id_user):
            return [K.select_request_that_have_starttrip_by_id_user.id_user: id_user]
        case .select_user_by_id(let id_user):
            return [K.select_user_by_id.id_user: id_user]
        case .start_trip(let id_request, let new_km):
            return[K.end_trip.id_request: id_request ,K.end_trip.new_km: new_km]
        case .update_car_rate(let id_car, let number_rate):
            return[K.update_car_rate.id_car: id_car ,K.update_car_rate.number_rate: number_rate]
        case .update_user_rate(let id_user, let number_rate):
            return[K.update_user_rate.id_user: id_user ,K.update_user_rate.id_user: number_rate]
        case .update_car(let id_car, let id_owner, let owner, let image, let price_rent_per_day, let available_date_from, let available_date_to, let number_km, let price_km, let price_trip, let city, let area, let st_name, let number_hone, let lon, let lat, let number_of_trip, let model, let type, let rate):
            return [K.update_car.id_car: id_car , K.update_car.id_owner: id_owner ,K.update_car.owner: owner ,K.update_car.image: image ,K.update_car.price_rent_per_day: price_rent_per_day ,K.update_car.available_date_from: available_date_from ,K.update_car.available_date_to: available_date_to ,K.update_car.number_km: number_km ,K.update_car.price_km: price_km ,K.update_car.price_trip: price_trip ,K.update_car.city: city ,K.update_car.area: area ,K.update_car.st_name: st_name ,K.update_car.number_hone: number_hone ,K.update_car.lon: lon ,K.update_car.lat: lat ,K.update_car.number_of_trip: number_of_trip ,K.insert_car.model: model ,K.update_car.type: type ,K.update_car.rate: rate]
        case .update_user(let id_user, let name, let email, let password, let phone, let address, let license, let img):
            return [K.update_user.id_user: id_user , K.update_user.name: name ,K.update_user.email: email ,K.update_user.password: password ,K.update_user.phone: phone ,K.update_user.address: address, K.update_user.license: license, K.update_user.img: img]
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let url = try K.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        
        
        // Parameters
        var encodedURLRequest:URLRequest? = nil
        
        var Vparameters: [String: Any]
        print(urlRequest)
        if(parameters == nil)
        {
            encodedURLRequest = try URLEncoding.queryString.encode(urlRequest, with: nil)
        }else
        {
            Vparameters = parameters!
            encodedURLRequest = try URLEncoding.queryString.encode(urlRequest, with: Vparameters)
        }
        
        
        return encodedURLRequest!
        
    }
}

