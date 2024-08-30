//
//  UIKitTutorial4.UIPickerView.swift
//  Test_1
//
//  Created by admin_user on 29/08/24.
//

import Foundation
import UIKit

/// Class for demonstrations of UIDatePicker
class UIKitTutorial4PickerView: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate{
 
    let colors = ["green","yellow","red"]
    let places = ["house","yard","shop"]
 
    weak var label : UILabel?
    //MARK: - Init

    init(label : UILabel?) {
        super.init(frame: .zero)
        self.label = label
        
        customInit()
    }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   func customInit(){
       self.delegate = self
       self.dataSource = self
       var values = label?.text?.components(separatedBy: " ").map{ Int($0) ?? 0 } ?? [0,0]
       if values.count < 2 {
           values =  [0,0]
       }
       selectRow(values[0], inComponent: 0, animated: false)
       selectRow(values[1], inComponent: 1, animated: false)
   }
    
    //MARK: - UIPickerViewDataSource, UIPickerViewDelegat
    //TODO: - check and test

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return colors.count
        } else {
            return places.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return colors[row]
        } else {
            return places[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        let row0 = pickerView.selectedRow(inComponent: 0)
        let row1 = pickerView.selectedRow(inComponent: 1)
        
        label?.text = colors[row0] + " " + places[row1]
    }
}


