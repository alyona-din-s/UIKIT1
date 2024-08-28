//
//  UIKitTutorial3.UIButton.swift
//  Test_1
//
//  Created by admin_user on 28/08/24.
//

import Foundation
import UIKit

class UIKitTutorial3Button: UIButton {
      
    
    init() {
        super.init(frame: .zero)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customInit(){
        self.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        self.setTitle("Button", for: .normal)
        self.backgroundColor = .black
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.addTarget(self, action: #selector(onButtonTap), for: .touchUpInside)
    }

    @objc
    func onButtonTap(){
        print("onButtonTap")
    }
}
