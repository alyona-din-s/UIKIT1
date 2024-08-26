//
//  UIKitTutorial1.swift
//  Test_1
//
//  Created by admin_user on 26/08/24.
//

import UIKit
import SnapKit
 
class UIKitTutorial1VC: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMySubviews()
    }
    
   
   func addMySubviews(){
        
       let scrollView = UIKitTutorial1ScrollView(frame: view.bounds)
       view.addSubview(scrollView)
       
       scrollView.snp.makeConstraints { make in
           make.center.equalTo(view)
           make.size.equalTo(view)
       }

   }
    
}
