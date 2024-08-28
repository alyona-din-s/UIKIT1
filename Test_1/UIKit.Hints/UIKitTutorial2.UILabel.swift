//
//  UIKitTutorial2.UILabel.swift
//  Test_1
//
//  Created by admin_user on 27/08/24.
//


import Foundation
import UIKit

class UIKitTutorial2Label: UILabel {
     
    // for more info about UILabel
    // https://medium.com/@marcusziade/uilabel-the-ultimate-guide-e07064e5c1d9

    init() {
        super.init(frame: .zero)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customInit(){
//        self.text = "Label Text"
        let attributedString = NSMutableAttributedString(string: "US National Weather Service")
        attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: NSRange(location: 0, length: 5))
        self.attributedText = attributedString
//        self.font = UIFont.boldSystemFont(ofSize: 20)
//        self.font = UIFont.italicSystemFont(ofSize: 20)
        self.font = UIFont(name: "Helvetica", size: 20)
        self.textColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        self.textAlignment = .center
        self.lineBreakMode = .byTruncatingTail
        self.adjustsFontSizeToFitWidth = true
        self.numberOfLines = 0
        self.shadowColor = UIColor.green
        self.shadowOffset = CGSize(width: 0.2, height: 0.3)
        self.isUserInteractionEnabled = true

     }
//    UIKit 2ч (UILabel, UITextView, UITextField, UISearchView)

}
