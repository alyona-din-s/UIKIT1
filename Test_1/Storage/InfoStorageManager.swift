//
//  InfoStorageManager.swift
//  Test_1
//
//  Created by admin_user on 10/10/24.
//
  
import Foundation

class InfoStorageManager {
     
    
    static func readVersionInfoFromInfo() -> String{
        
        let appBuildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""

        return appBuildNumber
    }
 
    static func writeSome(){
        Bundle.main.setValue("SomE", forKey: "some")
    }
    
    
    static func readFrom(plistName: String) -> String {
        guard let path = Bundle.main.path(forResource: "customPlist", ofType: "plist") else {return ""}
        let url = URL(fileURLWithPath: path)

        do {
            let data = try Data(contentsOf: url)
        } catch {
            print(error.localizedDescription)
        }
//        guard let plist = try! PropertyListSerialization.propertyList(from: data, format: nil) as? [[String:String]] else {return}

//        print(plist)
        return ""
    }
}
