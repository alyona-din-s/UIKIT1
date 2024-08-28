//
//  UIKitTutorial3.UIStepper.swift
//  Test_1
//
//  Created by admin_user on 28/08/24.
//


import Foundation
import UIKit

class UIKitTutorial3Stepper: UIStepper {
 
  weak var label : UILabel?
  
  init(label : UILabel?) {
      super.init(frame: .zero)
      self.label = label
      customInit()
  }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   func customInit(){
       self.minimumValue = 0
       self.maximumValue = 10
       self.value = 5
       label?.text = String(self.value)
       self.addTarget(self, action: #selector(switchValueDidChange), for: .valueChanged)
    }
    
    @objc
    func switchValueDidChange(_ sender: UISwitch!) {
        label?.text = String(self.value)
    }
}


