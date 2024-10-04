//
//  Model.swift
//  Test_1
//
//  Created by admin_user on 02/10/24.
//

 
import Foundation


struct User: Codable {
    let firstName: String
    let graduationDay: String
    
    
    static func decodeFrom(data: Data) -> User? {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        var user: User? = nil
        do {
            user = try decoder.decode(User.self, from: data)
        } catch {
            print("Error? could not be parsed")
        }
         
        return user
        
    }
 
 
    static func encodeSample() -> Data? {
        
        let user = User(firstName: "John", graduationDay: "01-08-2011")
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let jsonData = try encoder.encode(user)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print("Encoder" + jsonString)
            }
            return jsonData
        } catch {
            print("encode failed")
            return nil
        }
    }
}
 
