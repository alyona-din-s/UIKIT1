//
//  UIKitTutorial3.UIButton.swift
//  Test_1
//
//  Created by admin_user on 28/08/24.
//

import Foundation
import UIKit

class UIKitTutorial3Button: UIButton {
      
    weak var delegate: UIKitTutorialVC?
 
    init() {
        super.init(frame: .zero)
        customInit()
    }  
    
    init(delegate: UIKitTutorialVC?) {
        super.init(frame: .zero)
        self.delegate = delegate
        customInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customInit(){
        self.frame = CGRect(x: 0, y: 0, width: 120, height: 40)
        self.setTitle("Next", for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.backgroundColor = .black
        
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 8
        
        guard let delegate = delegate else { return }
        self.addTarget(delegate, action: #selector(UIKitTutorialVC.onNextViewController), for: .touchUpInside)
    }

    @objc
    func onButtonTap(){
        print("onButtonTap")
    }
}
