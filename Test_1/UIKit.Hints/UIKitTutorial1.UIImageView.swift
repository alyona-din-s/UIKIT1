//
//  UIKitTutorial1.UIImageView.swift
//  Test_1
//
//  Created by admin_user on 26/08/24.
//

import UIKit

class UIKitTutorial1ImageView: UIImageView {
    var subViewRect: UIView!
    
    init() {
        let image = UIImage(systemName: "star.leadinghalf.filled")
//        let image = UIImage(named: "img1")
        super.init(image: image)
        customInit()
    }
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customInit(){
        self.layer.shadowColor = UIColor.blue.cgColor
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 2
        self.backgroundColor = .green
     }
    
}
