//
//  UIKitTutorial2.UITextField.swift
//  Test_1
//
//  Created by admin_user on 27/08/24.
//


import Foundation
import UIKit

class UIKitTutorial2TextField: UITextField, UITextFieldDelegate {
     
    init() {
        super.init(frame: .zero)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customInit(){
        self.borderStyle = .roundedRect
        self.placeholder = "Enter your text here"
        self.delegate = self
        
        self.backgroundColor = .green
        self.textColor = .black
        self.font =  UIFont.italicSystemFont(ofSize: 20)
        self.borderStyle = .line
        self.clearButtonMode = .always
        self.keyboardType = .emailAddress
        self.isSecureTextEntry = false
      }
 
    
    //MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Text field did begin editing")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Text field did end editing")
        textField.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
