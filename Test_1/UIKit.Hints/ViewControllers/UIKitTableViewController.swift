//
//  UIKitTableViewController.swift
//  Test_1
//
//  Created by admin_user on 11/09/24.
//

import UIKit

class UIKitTableViewController : UIViewController {
    
    var tableView = UITableView()
    let character = ["123", "234", "345", "435647"]
    let items = [ItemInfo(name: "New York",
                          day: "Sunday",
                          temp: 13,
                          description: "clear",
                          high: 13,
                          low: 16),
                 ItemInfo(name: "Moscow",
                                 day: "Sunday",
                                 temp: 21,
                                 description: "clear",
                                 high: 25,
                                 low: 16),
                 ItemInfo(name: "London",
                                 day: "Sunday",
                                 temp: 21,
                                 description: "clear",
                                 high: 35,
                                 low: 46)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 90
        tableView.register(UIKitTableViewCell.self, forCellReuseIdentifier: "MY_aweseome_cell")
        addTableView()
    }
    
    func addTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
}

extension UIKitTableViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tap")
    }
}

extension UIKitTableViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MY_aweseome_cell", for: indexPath) as? UIKitTableViewCell
        guard let cell = cell else {
            return UITableViewCell()
        }
        cell.configure(item: items[indexPath.row])
        return cell
    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat.random(in: 30..<50)
//    }
    
}
