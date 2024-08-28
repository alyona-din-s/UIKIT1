//
//  UIKitTutorial2.UITextView.swift
//  Test_1
//
//  Created by admin_user on 27/08/24.
//

import Foundation
import UIKit

class UIKitTutorial2TextView: UITextView, UITextViewDelegate {
 
    init() {
        super.init(frame: CGRect.zero, textContainer: nil)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customInit(){
        let textLine = "A Heat Advisory is in effect for western portions of our area on Wednesday from 11 AM to 8 PM. Peak Heat Index values in these areas could reach 100 to 103. Practice heat safety wherever you are!"
         let attributeText = NSMutableAttributedString(string: textLine, 
                                                       attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
      attributeText.append(NSAttributedString(string: "(sample)",
                                              attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor : UIColor.red]))
        attributeText.append(NSAttributedString(string: "A Heat Advisory is in effect for western portions of our area on Wednesday from 11 AM to 8 PM. Peak Heat Index values in these areas could reach 100 to 103. Practice heat safety wherever you are!",
                                                attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)]))
        self.attributedText = attributeText
        self.textAlignment = .justified
        self.isEditable = true
        self.isScrollEnabled = false
        self.translatesAutoresizingMaskIntoConstraints = false
      }
 
    
    //MARK: -
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
     
        return true
    }

    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        
        textView.resignFirstResponder()
        return true
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView){
        textView.resignFirstResponder()

    }

}
