//
//  FileStorage.swift
//  Test_1
//
//  Created by admin_user on 03/10/24.
//

import Foundation

class FileStorageManager {
     
    
    static func readFromFile(_ fileName: String, _ resultAction: ((User?) -> Void)){
        
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            resultAction(nil)
            return
        }
 
        do {
            let fileURL = documentsDirectory.appendingPathComponent(fileName)
//            let customUrl = URL(fileURLWithPath: "/User/user/Desktop/file.txt")
            let userData = try Data(contentsOf: fileURL)
            let user = User.decodeFrom(data: userData)
            resultAction(user)
        } catch {
            print("an error happened while checking for the file \(error.localizedDescription)")
            resultAction(nil)
        }

    }
 
    static func writeToFile(info: Data, fileName: String ){

        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = documentsDirectory.appendingPathComponent(fileName)
            do {
                try info.write(to: filePath)
            } catch {
                print("an error happened while creating the file")
            }
        }
    }
}
