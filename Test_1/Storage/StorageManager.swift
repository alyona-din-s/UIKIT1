//
//  StorageManager.swift
//  Test_1
//
//  Created by admin_user on 02/10/24.
//

import Foundation
//struct Values: Decodable, Encodable {
//    let firstName: String
//    let lastName: String
//    let birthDate: Date
//
//    enum CodingKeys: String, CodingKey {
//        case firstName = "user_first_name"
//        case lastName = "user_last_name"
//        case age
//    }
//}
class StorageManager {

    /*
     UserDefaults to store any basic data type for as long as the app is installed.
     Bool, Float, Double, Int, String, URL, and more complex types such as arrays, dictionaries, Date and Data values.
     
     ---- Setting Default Values ---

     set(Any?, forKey: String)  
     set(Float, forKey: String)
     set(Double, forKey: String)
     set(Int, forKey: String)
     set(Bool, forKey: String)
     set(URL?, forKey: String)
     
     ---- Getting Default Values ---
     object(forKey: String) -> Any? // returns Any? so you need to conditionally typecast it to your data type.
     url(forKey: String) -> URL?
     array(forKey: String) -> [Any]?
     dictionary(forKey: String) -> [String : Any]?
     string(forKey: String) -> String?
     stringArray(forKey: String) -> [String]?
     data(forKey: String) -> Data?
     bool(forKey: String) -> Bool // returns a boolean if the key existed, or false if not.
     integer(forKey: String) -> Int //returns an integer if the key existed, or 0 if not.
     float(forKey: String) -> Float
     double(forKey: String) -> Double
 
     
     ---- Removing Defaults ---
     
     removeObject(forKey: String)
 
     */
    func saveUserEnterInfo(){
        let defaults = UserDefaults.standard
 
        //MARK: - Write
        
        defaults.set(25, forKey: "Age")
        defaults.set(true, forKey: "UseTouchID")
        defaults.set(CGFloat.pi, forKey: "Pi")
        defaults.set("Paul Hudson", forKey: "Name")
        defaults.set(Date(), forKey: "LastRun")
        
        let array = ["Hello", "World"]
        defaults.set(array, forKey: "SavedArray")

        let dict = ["Name": "Paul", "Country": "UK"]
        defaults.set(dict, forKey: "SavedDict")
        
        //MARK: - Read
        
        let _ = defaults.object(forKey:"SavedArray") as? [String] ?? [String]()
        let _ = defaults.object(forKey: "SavedDict") as? [String: String] ?? [String: String]()

        
       
    }
    
    
    func sample(){
        let defaults = UserDefaults.standard

        //MARK: - SAMPLE

        //write
        let data = User.encodeSample()
        defaults.set(data, forKey: "userData")

        
        //read
        if let dataFromUserDefaults = defaults.object(forKey:"userData") as? Data {
            let user = User.decodeFrom(data: dataFromUserDefaults)
            print(user?.firstName ?? "-")
        }
        
    }
    
    func saveCloudUserEnterInfo(){
        
        let cloudDefaults =  NSUbiquitousKeyValueStore.default
        cloudDefaults.set("some name", forKey: "Key")
        cloudDefaults.synchronize()

    }
}
