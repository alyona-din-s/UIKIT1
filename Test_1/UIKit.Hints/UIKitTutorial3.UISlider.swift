//
//  UIKitTutorial3.UISlider.swift
//  Test_1
//
//  Created by admin_user on 28/08/24.
//
 
import Foundation
import UIKit

class UIKitTutorial3Slider: UISlider {
      
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
        let initialValue: Float = 8.0 
        self.minimumValue = 0.0
        self.maximumValue = 10.0
        self.value = initialValue
        self.tintColor = .orange
        self.addTarget(self, action: #selector(sliderDidChangeValue(_:)), for: .valueChanged)
   
        label?.text = String(initialValue)
        
    }
 
    @objc 
    func sliderDidChangeValue(_ sender: UISlider) {
        let value = sender.value
        label?.text = String(value)
    }
}
