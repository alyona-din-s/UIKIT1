//
//  UIKitTutorial1.swift
//  Test_1
//
//  Created by admin_user on 26/08/24.
//

// SF Symbols

//Реализуйте метод в вашем кастомном вью заголовка на контролере, 
//который будет в зависимости от прокрутки UIScrollView показывать
//схожую логику с нативным приложением (поэтапно скрывать строки и затем показывать
//уменьшенную версию подробной информации)
//

import UIKit
import SnapKit
 
class UIKitTutorialVC: UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addMySubviews4Tutorial4()
        checkStorages()
    }
    
    deinit {
        print("deinit")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white

    }

    func checkStorages(){
        
        SafeStorageManager.sh.saveUserEneterData()

        SafeStorageManager.sh.updateUserEnterData()

        SafeStorageManager.sh.getUserEneterData()
 

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
        let button = UIKitTutorial3Button(delegate: self)
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
        
        
//        navigationController?.viewControllers
        
        // HomeViewController, SearchVIewController DetailViewController
        
        nc?.openNewSearchView()
    }
 
    @objc
    func onWebViewController(){
        let nc = navigationController as? UIKitTutorialNavigation
        nc?.openNewWebView()
    }
 
    func addMySubviews4Tutorial4(){
 
        let buttonforWebView = UIKitTutorial3Button()
        buttonforWebView.setTitle("WebView", for: .normal)
        buttonforWebView.addTarget(self, action: #selector(onWebViewController), for: .touchUpInside)

        let buttonforSearchView = UIKitTutorial3Button()
        buttonforSearchView.setTitle("SearchView", for: .normal)
        buttonforSearchView.addTarget(self, action: #selector(onNextViewController), for: .touchUpInside)

        let button = UIKitTutorial3Button()
        button.setTitle("addSomeView", for: .normal)
        button.addTarget(self, action: #selector(onAddSubView), for: .touchUpInside)
        button.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        let labelForPickerView = UIKitTutorial2Label()
        labelForPickerView.text = "Date label"
        labelForPickerView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        let pickerView = UIKitTutorial4PickerView(label: labelForPickerView)
        pickerView.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        
        let labelForDatePicker = UIKitTutorial2Label()
        labelForDatePicker.text = "DatePicker"
        labelForDatePicker.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(40)
        }

        let datePicker = UIKitTutorial4DatePicker(label: labelForDatePicker)
 
        let stackView = UIStackView()
        stackView.addArrangedSubview(buttonforWebView)
        stackView.addArrangedSubview(buttonforSearchView)
        stackView.addArrangedSubview(button)
        
        stackView.addArrangedSubview(labelForPickerView)
        stackView.addArrangedSubview(pickerView)
        stackView.addArrangedSubview(labelForDatePicker)
        stackView.addArrangedSubview(datePicker)
 
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
        ])
    }
     
    @objc
    func onAddSubView(){
        let cmallVC = UIKitTutorialWebViewController()
        cmallVC.modalPresentationStyle = .automatic
        present(cmallVC, animated: true)
    }
    
}
