//
//  APIClient.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 14/12/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//
import Alamofire
import SwiftyJSON
class APIClient {
   @discardableResult
   private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T,AFError>)->Void) -> DataRequest {
       return AF.request(route)
                       .responseDecodable (decoder: decoder){
                           (response: DataResponse<T,AFError>) in
                           completion(response.result)
       }
   }
    
   @discardableResult
   private static func performRequestSimple(route:APIRouter, completion: @escaping (Result<String, AFError>)->Void) -> DataRequest {
       return AF.request(route)
           .responseString(encoding: String.Encoding.utf8) {
               (response) in
               completion(response.result)
       }
   }
    
    @discardableResult
    private static func performRequestSimplejson(route:APIRouter, completion: @escaping (Result<String, AFError>)->Void) -> DataRequest {
        return AF.request(route).responseJSON{
            response  in
        }
            .responseString(encoding: String.Encoding.utf8) {
                (response) in
                completion(response.result)
        }
    }
    //---------------------------------------------------
    
//    static func loginCenterAndTrainer(email: String, password: String, completion:@escaping (Result<[LoginResponse],AFError>)->Void) {
//      performRequest(route: APIRouter.agrre_refuse(id_request: <#T##Int#>), completion: completion)
//
//    }
    static func agrre_refuse(id_request: Int , completion: @escaping (Result<String,AFError>)->Void) {
        performRequestSimple(route: APIRouter.agrre_refuse(id_request: id_request), completion: completion)
    }
    
    static func agrre_request(id_request: Int ,km: Int , completion: @escaping (Result<String,AFError>)->Void) {
        performRequestSimple(route: APIRouter.agrre_request(id_request: id_request, km: km), completion: completion)
    }
    
    static func forgete_password_by_email(email: String , completion: @escaping (Result<String,AFError>)->Void) {
           performRequestSimple(route: APIRouter.forgete_password_by_email(email: email), completion: completion)
       }
    
    
    static func logIn(email: String ,password: String , completion: @escaping (Result<[Login],AFError>)->Void) {
        performRequest(route: APIRouter.login_user(email: email, pass: password), completion: completion)
    }
    
    static func register( name : String ,email : String ,password:String,phone : String ,address : String ,license : String ,rate : String ,completion: @escaping (Result<String,AFError>)->Void) {
        performRequestSimple(route: APIRouter.register(name: name, email: email, password: password, phone: phone, address: address, license: license, rate: rate), completion: completion)
    }
    static func addCar( id_owner : Int ,owner : String ,image:String,price_rent_per_day : String ,available_date_from : String ,available_date_to : String ,number_km : String ,price_km : String ,price_trip: String ,city : String,area : String,st_name : String,number_hone : String,lon : String,lat : String,number_of_trip : String,model : String,type : String,rate : String ,completion: @escaping (Result<String,AFError>)->Void){
        performRequestSimple(route: APIRouter.insert_car(id_owner: id_owner, owner: owner, image: image, price_rent_per_day: price_rent_per_day, available_date_from: available_date_from, available_date_to: available_date_to, number_km: number_km, price_km: price_km, price_trip: price_trip, city: city, area: area, st_name: st_name, number_hone: number_hone, lon: lon, lat: lat, number_of_trip: number_of_trip, model: model, type: type, rate: rate), completion: completion)
    }
    
    static func getAllRequestsByOwnerId(Id_Request: Int , completion: @escaping (Result<[GetRequest],AFError>)->Void) {
        performRequest(route: APIRouter.select_request_by_id_owner(id_request: Id_Request), completion: completion)
    }
    
    static func addRequest(id_user:Int ,id_owner:Int , id_car:Int , message:String , datee:String,completion: @escaping (Result<String,AFError>)->Void){
        performRequestSimple(route: APIRouter.insert_request_car(id_user: id_user, id_owner: id_owner, id_car: id_car, message: message, datee: datee), completion: completion)
    }
    static func updateUser (id_user: Int ,name: String ,
                            email : String , password: String , phone: String ,address: String ,license: String,completion: @escaping (Result<String,AFError>)->Void) {
        performRequestSimple(route: APIRouter.update_user(id_user: id_user, name: name, email: email, password: password, phone: phone, address: address, license: license), completion: completion)
        
    }
    static func getNoteByUserID(id_user : Int ,completion: @escaping (Result<[Note],AFError>)->Void){
        performRequest(route: APIRouter.select_note_by_id_user(id_user: id_user), completion: completion)
    }
    
    static func getAllNoteByOwnerID(id_owner: Int ,completion: @escaping (Result<[Note],AFError>)->Void) {
        performRequest(route: APIRouter.select_note_by_id_owner(id_owner: id_owner), completion: completion)
    }
                                    
                                    
    static func getAllCarsByRate(number_of_select : Int ,completion: @escaping (Result<String,AFError>)->Void){
        performRequestSimple(route: APIRouter.select_all_cars_by_rate(number_of_select: number_of_select), completion: completion)
    }
    
    static func getAllCars(number_of_select : Int ,completion: @escaping (Result<[Car],AFError>)->Void){
        performRequest(route: APIRouter.select_all_cars(number_of_select: number_of_select), completion: completion)
    }
    
    static func getAllCarsById(id : Int ,completion: @escaping (Result<String,AFError>)->Void){
        performRequestSimple(route: APIRouter.select_all_car_by_id(id: id), completion: completion)
    }
    
    static func getAllCarsByCityAndDate(city: String ,available_date_from: String , available_date_to: String ,completion: @escaping (Result<String,AFError>)->Void){
        performRequestSimple(route: APIRouter.select_all_car_by_city_and_date(city: city, available_date_from: available_date_from, available_date_to: available_date_to), completion: completion)
    }
    
    static func getAllCarsByCity(city : String ,completion: @escaping (Result<String,AFError>)->Void) {
        performRequestSimple(route: APIRouter.select_all_car_by_city(city: city), completion: completion)
    }
    
    static func addNote(id_user:Int ,id_owner:Int , id_car:Int , title:String , details:String , datee:String ,completion: @escaping (Result<String,AFError>)->Void){
        performRequestSimple(route: APIRouter.insert_note_car(id_user: id_user, id_owner: id_owner, id_car: id_car, title: title, details: details, datee: datee), completion: completion)
    }
    
    static func refuseRequest(id_request:Int ,completion: @escaping (Result<String,AFError>)->Void){
        performRequestSimple(route: APIRouter.agrre_refuse(id_request: id_request), completion: completion)
    }
    
    static func acceptRequest(id_request: Int ,km: Int ,completion: @escaping (Result<String,AFError>)->Void){
        performRequestSimple(route: APIRouter.agrre_request(id_request: id_request, km: km), completion: completion)
    }
    
    
}


