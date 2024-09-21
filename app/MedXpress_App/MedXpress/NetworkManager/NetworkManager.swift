//
//  NetworkManaget.swift
//  MedXpress
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import Foundation
import Alamofire

import Alamofire

class NetworkManager {

    static let shared = NetworkManager()
    private init() {}
    
    let base_url_1 = "https://852e-84-54-114-148.ngrok-free.app"

    // Function to get the room ID
    func makeRoom(completion: @escaping (String?) -> Void) {
        let url = "https://4ee8-45-9-228-74.ngrok-free.app/room/ai/make"
        
        AF.request(url, method: .get, headers: ["accept": "application/json"]).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any], let roomId = json["room_id"] as? String {
                    print("Room ID: \(roomId)")
                    completion(roomId)
                } else {
                    print("Error: Unable to parse response")
                    completion(nil)
                }
                
            case .failure(let error):
                print("Request failed with error: \(error)")
                completion(nil)
            }
        }
    }

    // Function to get the token
    func getToken(identityName: String, roomId: String, name: String, completion: @escaping (String?) -> Void) {
        let url = "https://4ee8-45-9-228-74.ngrok-free.app/room/ai/get_token"
        
        let parameters: [String: String] = [
            "identity_name": identityName,
            "room_id": roomId,
            "name": name
        ]
        
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: ["accept": "application/json"]).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any], let token = json["token"] as? String {
                    print("Token: \(token)")
                    completion(token)
                } else {
                    print("Error: Unable to parse response")
                    completion(nil)
                }
                
            case .failure(let error):
                print("Request failed with error: \(error)")
                completion(nil)
            }
        }
    }
    
    func login(email: String, password: String, completion: @escaping (String?) -> Void) {
         let url = "\(base_url_1)/api/User/login"
         
         // Parameters for the POST request
         let parameters: [String: String] = [
             "email": email,
             "password": password
         ]
         
         AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.queryString, headers: ["accept": "*/*"]).responseJSON { response in
             switch response.result {
             case .success(let value):
                 if let json = value as? [String: Any], let token = json["token"] as? String {
                     print("Token: \(token)")
                     completion(token)
                 } else {
                     print("Error: Unable to parse response")
                     completion(nil)
                 }
                 
             case .failure(let error):
                 print("Request failed with error: \(error)")
                 completion(nil)
             }
         }
     }
    
    func getTopRatedDoctors(completion: @escaping ([Doctor]?) -> Void) {
        let url = "\(base_url_1)/api/Doctor"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(UD.token!)"
        ]
                
        AF.request(url, method: .get, headers: headers).responseDecodable(of: [Doctor].self) { response in
              switch response.result {
              case .success(let doctors):
                  // Sort doctors by ranking in descending order and limit to 10
                  let topDoctors = doctors.sorted(by: { $0.ranking > $1.ranking }).prefix(10)
                  print("xxx", topDoctors)
                  completion(Array(topDoctors))
              case .failure(let error):
                  print("Failed to get doctors: \(error)")
                  completion(nil)
              }
          }
    }
    
    func getUpcomingAppointments(userId: Int, completion: @escaping ([Appointment]?) -> Void) {
        let url = "\(base_url_1)/api/User/upcoming"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(UD.token!)"
        ]
        
        
        AF.request(url, method: .get, headers: headers).responseDecodable(of: [Appointment].self) { response in
            
            let string = String(bytes: response.data!, encoding: .utf8)
            print("TTTT")
            print(string ?? "nil")
            
            switch response.result {
            case .success(let appointments):
                completion(appointments)
            case .failure(let error):
                print("Failed to get appointments: \(error)")
                completion(nil)
            }

        }
    }
    
    func getAppointments(userId: Int, completion: @escaping ([Appointment]?) -> Void) {
        let url = "\(base_url_1)/api/User/appointments"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(UD.token!)"
        ]
        
        AF.request(url, method: .post, headers: headers).responseDecodable(of: [Appointment].self) { response in
            switch response.result {
            case .success(let appointments):
                completion(appointments)
                
            case .failure(let error):
                print("Failed to get appointments: \(error)")
                completion(nil)
            }
        }
    }
    
    func getUserDetails(completion: @escaping (MyUser?) -> Void) {
        let url = "\(base_url_1)/api/User/me"
        
        let headers: HTTPHeaders = [
            "accept": "application/json",
            "Authorization": "Bearer \(UD.token!)" // Make sure UD.token is set
        ]
        
        AF.request(url, method: .get, headers: headers).responseDecodable(of: MyUser.self) { response in
            switch response.result {
            case .success(let user):
                completion(user)
            case .failure(let error):
                print("Failed to get user details: \(error)")
                completion(nil)
            }
        }
    }
    
}
