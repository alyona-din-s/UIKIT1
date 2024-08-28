//
//  UIKitTutorial3.UISwitch.swift
//  Test_1
//
//  Created by admin_user on 28/08/24.
//


import Foundation
import UIKit

class UIKitTutorial3Switch: UISwitch {
     

   init() {
       super.init(frame: .zero)
       customInit()
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   func customInit(){
       self.isOn = false
       self.setOn(true, animated: true)
       self.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
    }

    @objc 
    func switchValueDidChange(_ sender: UISwitch!) {
        if (sender.isOn){
            print("on")
        }
        else{
            print("off")
        }
    }
}
