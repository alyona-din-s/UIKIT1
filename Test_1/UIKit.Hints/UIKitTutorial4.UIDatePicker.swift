//
//  UIKitTutorial4.UIDatePicker.swift
//  Test_1
//
//  Created by admin_user on 29/08/24.
//
 
import Foundation
import UIKit

/// Class for demonstrations of UIDatePicker
class UIKitTutorial4DatePicker: UIDatePicker {
 
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
       
       self.backgroundColor = UIColor.white
       self.preferredDatePickerStyle = .inline
       self.datePickerMode = .dateAndTime
       self.locale = Locale(identifier: "en_GB")
//       self.calendar = Calendar(identifier: .chinese)
       self.timeZone = TimeZone.current
       self.date = getLabelTextToDate()
       self.minimumDate = Calendar.current.date(byAdding: .day, value: -30, to: self.date)
       self.maximumDate = Calendar.current.date(byAdding: .day, value: 30, to: self.date)
//       self.countDownDuration = 5
//       self.minuteInterval = 29
       self.addTarget(self, action: #selector(onValueDidChange), for: .valueChanged)
    }
    
    @objc
    func onValueDidChange(_ sender: UIDatePicker!) {
        setLabelText(sender.date)
    }
    
    //MARK: - Internal
    func getLabelTextToDate() -> Date {
        guard let textFromLabel =  label?.text else {
            return Date.now
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        let date = formatter.date(from: textFromLabel) ?? Date.now
        return date
     }

    func setLabelText(_ date: Date = Date.now){
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        label?.text = formatter.string(from: date)
    }
}


