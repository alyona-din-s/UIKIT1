//
//  UIKitTutorial1.swift
//  Test_1
//
//  Created by admin_user on 26/08/24.
//

// SF Symbols

import UIKit
import SnapKit
 
class UIKitTutorialVC: UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addMySubviews4Tutorial3()
    }
    
    deinit {
        print("deinit")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white

    }

 
   func addMySubviews4Tutorial1(){
        
       let scrollView = UIKitTutorial1ScrollView(frame: view.bounds)
       view.addSubview(scrollView)
       
       scrollView.snp.makeConstraints { make in
           make.center.equalTo(view)
           make.size.equalTo(view)
       }

   }
    
    func addMySubviews4Tutorial2(){
 
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
    
    func addMySubviews4Tutorial3(){
        
        let sampleView = UIKitTutorial1View()
        sampleView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(4)
        }
        var button = UIKitTutorial3Button(delegate: self)
//        button.addTarget(self, action: #selector(onNextViewController), for: .touchUpInside)
        button.snp.makeConstraints { make in
            make.width.equalTo(90)
            make.height.equalTo(40)
        }
        let labelForSlider = UIKitTutorial2Label()
        let slider = UIKitTutorial3Slider(label: labelForSlider)
        slider.snp.makeConstraints { make in
            make.width.equalTo(200)
        }
        
        let switcher = UIKitTutorial3Switch()
        let labelForStepper = UIKitTutorial2Label()
        let stepper = UIKitTutorial3Stepper(label: labelForStepper)
        
        let stackView = UIStackView(arrangedSubviews: [sampleView, labelForSlider, slider, switcher, labelForStepper, stepper, button])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        view.addSubview(stackView)
  
        // Sample standart constraints

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
        ])
        
        // Sample SnapKit constraints

//        stackView.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
//            make.centerX.equalTo(view)
//            make.height.equalTo(view).multipliedBy(0.5)
//        }
        
    }
     
    @objc
    func onNextViewController(){
        let nc = navigationController as? UIKitTutorialNavigation
        nc?.openNewSearchView()
    }
}
