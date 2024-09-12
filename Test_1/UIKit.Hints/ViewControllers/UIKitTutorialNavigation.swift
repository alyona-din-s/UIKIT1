//
//  UIKitTutorialNavigation.swift
//  Test_1
//
//  Created by admin_user on 28/08/24.
//

import UIKit
 

class UIKitTutorialNavigation : UINavigationController {
     
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setDefaultViewController()
        navigationBar.barStyle = .default

    }
    
    func setDefaultViewController(){
        
        // Sample init UIKitTutorialVC with code
        let vc = UIKitTableViewController()
        
        // Sample init with StoryBoard
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UIKitTutorialVC") as! UIKitTutorialVC
//         vc.navigationItem.title = "Home"
        self.setViewControllers([vc], animated: true)
    }
    
    @objc
    func openNewSearchView(){
        let searchVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UIKitTutorialSearchVC") as! UIKitTutorialSearchVC
        searchVC.navigationItem.title = "Search"
 
        self.pushViewController(searchVC, animated: true)

    }
    
    @objc
    func openNewWebView(){
        let vc = UIKitTutorialWebViewController()
        vc.navigationItem.title = "WebView"
        self.pushViewController(vc, animated: true)

    }
}

