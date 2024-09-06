//
//  WeatherViewController.swift
//  Test_1
//
//  Created by admin_user on 05/09/24.
//

import UIKit

struct ItemInfo {
    let name: String
    let temp: Float
    let description: String
    let high : Float
    let low : Float
     
    
    static func creatTestValues() -> ItemInfo {
        return ItemInfo(name: "New York",
                        temp: 21,
                        description: "clear",
                        high: 25,
                        low: 16)
    }
}
 

class WeatherViewController : UIViewController {
    
    var scrollView : UIScrollView!
    var labelCity : UILabel!
    var labelTemp : UILabel!
    var labelDescr : UILabel!
    var labelPeacks : UILabel!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let info = ItemInfo.creatTestValues()
        createItems(info)
    }
     
    //MARK: - private
    
    private func createItems(_ info : ItemInfo){
        
        labelCity = UILabel()
        
        //TODO: -  Home Task
        
//        1. Create UIStackView with labelCity, labelTemp, labelDescr, labelPeacks
//        2. Place it above scrollView with Constraints (top,leading, trailing)
//        3. Add Constraint (top) for UIScrollView or Constraint (bottom) for UIStackView
//        4. Add any UIImageView on ScrollView
        
        
        scrollView = UIScrollView(frame: .zero)
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
         
    }
}
