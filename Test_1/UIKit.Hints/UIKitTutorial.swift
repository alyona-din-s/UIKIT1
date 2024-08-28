//
//  UIKitTutorial1.swift
//  Test_1
//
//  Created by admin_user on 26/08/24.
//

// SF Symbols

import UIKit
import SnapKit
 
class UIKitTutorial1VC: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addMySubviews4Tutorial2_1()
    }
    
   
   func addMySubviews4Tutorial1(){
        
       let scrollView = UIKitTutorial1ScrollView(frame: view.bounds)
       view.addSubview(scrollView)
       
       scrollView.snp.makeConstraints { make in
           make.center.equalTo(view)
           make.size.equalTo(view)
       }

   }
    
    func addMySubviews4Tutorial2_1(){
 
        let label = UIKitTutorial2Label()
        let textField = UIKitTutorial2TextField()
        let textView = UIKitTutorial2TextView()
        
        let stack = UIStackView(arrangedSubviews: [label, textField, textView])
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillProportionally
        stack.alignment = .center
        view.addSubview(stack)
 
        textField.snp.makeConstraints { make in
           make.height.equalTo(36)
       }
        stack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.centerX.equalTo(view)
            make.height.equalTo(view).dividedBy(2)
            make.width.equalTo(300)
        }
 
    }
//    
//    func addMySubviews4Tutorial2_2(){
//        let searchVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchController") as! UIKitTutorial2SearchVC
//        navigationController?.pushViewController(searchVC, animated: true)
//    }
}
