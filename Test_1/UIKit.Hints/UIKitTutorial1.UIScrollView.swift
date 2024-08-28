//
//  UIKitTutorial1.UIScrollView.swift
//  Test_1
//
//  Created by admin_user on 26/08/24.
//

import UIKit
import SnapKit

class UIKitTutorial1ScrollView: UIScrollView, UIScrollViewDelegate{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customInit(){
        backgroundColor = .white
        
        let stackView = UIKitTutorial1StackView()
        self.addSubview(stackView)
        
        let cg = self.contentLayoutGuide
        let fg = self.frameLayoutGuide

        // Standart NSLayoutConstraint
        
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: cg.topAnchor, constant: 12.0),
//            stackView.leadingAnchor.constraint(equalTo: cg.leadingAnchor, constant: 12.0),
//            stackView.trailingAnchor.constraint(equalTo: cg.trailingAnchor, constant: -12.0),
//            stackView.bottomAnchor.constraint(equalTo: cg.bottomAnchor, constant: -12.0),
//            stackView.widthAnchor.constraint(equalTo: fg.widthAnchor, constant: -24.0),
//        ])
        
        //Snp
        stackView.snp.makeConstraints { make in
            make.top.leading.equalTo(cg).offset(12)
            make.trailing.bottom.equalTo(cg).offset(-12)
            make.width.equalTo(fg).offset(-24)
        }
         
        
    }
    //MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
}
