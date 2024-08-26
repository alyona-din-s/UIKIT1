//
//  UIKitTutorial1.UIStackView.swift
//  Test_1
//
//  Created by admin_user on 26/08/24.
//

import UIKit
import SnapKit


class UIKitTutorial1StackView : UIStackView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customInit(){
        backgroundColor = .white
        
        self.axis = .vertical
        self.spacing = 8
        self.distribution = .fillProportionally
        self.alignment = .center

        for _ in 1...50 {
            let imageView = UIKitTutorial1ImageView()
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(60)
            }
            self.addArrangedSubview(imageView)
        }
    }
}
