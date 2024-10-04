//
//  SafeStorageManager.swift
//  Test_1
//
//  Created by admin_user on 02/10/24.
//

import Foundation
import Security

class SafeStorageManager {
    
    static var sh = SafeStorageManager()
    // Apple Documentation
    // https://developer.apple.com/documentation/security/storing-keys-in-the-keychain
    
    func saveUserEneterData(){
        let username = "johny"
        let password = "1234".data(using: .utf8)!
        
        // Set attributes
        let attributes: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: username,
            kSecValueData as String: password,
        ]
        // Add user
        if SecItemAdd(attributes as CFDictionary, nil) == noErr {
            print("User saved successfully in the keychain")
        } else {
            print("Something went wrong trying to save the user in the keychain")
        }
    }
    
    func updateUserEnterData(){
        // Set username and new password
        let username = "john"
        let newPassword = "5678".data(using: .utf8)!
        // Set query
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: username,
        ]
        // Set attributes for the new password
        let attributes: [String: Any] = [kSecValueData as String: newPassword]
        // Find user and update
        if SecItemUpdate(query as CFDictionary, attributes as CFDictionary) == noErr {
            print("Password has changed")
        } else {
            print("Something went wrong trying to update the password")
        }
    }

    func getUserEneterData(){
        // Set username of the user you want to find
        let username = "john"
        // Set query
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: username,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true,
        ]
        var item: CFTypeRef?
        // Check if user exists in the keychain
        if SecItemCopyMatching(query as CFDictionary, &item) == noErr {
            // Extract result
            if let existingItem = item as? [String: Any],
               let username = existingItem[kSecAttrAccount as String] as? String,
               let passwordData = existingItem[kSecValueData as String] as? Data,
               let password = String(data: passwordData, encoding: .utf8)
            {
                print(username)
                print(password)
            }
        } else {
            print("Something went wrong trying to find the user in the keychain")
        }
    }
    
    func deleteUserEnterData(){
        // Set username
        let username = "john"
        // Set query
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: username,
        ]
        // Find user and delete
        if SecItemDelete(query as CFDictionary) == noErr {
            print("User removed successfully from the keychain")
        } else {
            print("Something went wrong trying to remove the user from the keychain")
        }
    }
}
