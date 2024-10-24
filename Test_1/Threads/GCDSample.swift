//
//  GCDSample.swift
//  Test_1
//
//  Created by admin_user on 23/10/24.
//

import Foundation

class GCDSample {
    
    class func sample1(){
        DispatchQueue.global(qos: .utility).async {
            print("inside")
            DispatchQueue.main.async {
                print("outside")
            }
        }
    }
    
 
    class  func sample2(){
        let group = DispatchGroup()
        group.enter()
        DispatchQueue.global(qos: .utility).async {
            print("inside 1")
            group.leave()
        }
        
        group.enter()
        DispatchQueue.global(qos: .background).async {
            print("inside 2 ")
            group.leave()
        }
        
        group.enter()
        DispatchQueue.global(qos: .unspecified).async {
            print("inside 3 ")
            group.leave()
        }
        
        group.notify(queue: .main){
            print("outside")

        }
    }
}

