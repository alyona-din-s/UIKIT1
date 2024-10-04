//
//  FileStorage.swift
//  Test_1
//
//  Created by admin_user on 03/10/24.
//

import Foundation

class FileStorageManager {
     
    
    static func readFromFile(_ fileName: String, _ resultAction: ((User?) -> Void)){
 
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentsDirectory.appendingPathComponent(fileName)
            do {
                if try fileURL.checkResourceIsReachable() {
                    print("file exist")
                     do {
                         let userData = try Data(contentsOf: fileURL)
                         let user = User.decodeFrom(data: userData)
                         resultAction(user)
                         print("+ ", user?.firstName)
                         return
                    } catch {
                        print("an error happened while creating the file")
                    }
                }
            } catch {
                print("an error happened while checking for the file")
            }
        }
        resultAction(nil)
    }
    
    
    static func writeToFile(info: User, fileName: String ){
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = documentsDirectory.appendingPathComponent(fileName)
            do {
                if try filePath.checkResourceIsReachable() {
                    print("file exist")
                } else {
                    print("file doesnt exist")
                    do {
                        if let data = User.encodeSample() {
                            try data.write(to: filePath)
                        }
                    } catch {
                        print("an error happened while creating the file")
                    }
                }
            } catch {
                print("an error happened while checking for the file")
            }
        }
    }
    
    
    
    
}
