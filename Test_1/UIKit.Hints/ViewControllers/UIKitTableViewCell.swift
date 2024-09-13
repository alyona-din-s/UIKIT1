//
//  UIKitTableViewCell.swift
//  Test_1
//
//  Created by admin_user on 12/09/24.
//

import UIKit


class UIKitTableViewCell: UITableViewCell {
    
    let label1 = UILabel()
    let img1 = UIImageView()
    let label2 = UILabel()
    let img2 = CustomSmallView()
    let label3 = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addCustomViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomViews(){
        img2.frame.size = CGSize( width: 40, height: 40)
        label1.font = UIFont(name: "Helvetica", size: 16)
        label2.font = UIFont(name: "Helvetica", size: 14)
        label3.font = UIFont(name: "Helvetica", size: 14)
        img2.frame.size = CGSize( width: 80, height: 2)

        let stackView = UIStackView(arrangedSubviews: [label1,img1,label2,img1,label3])
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fill
        contentView.addSubview(stackView)

        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func configure(item: ItemInfo){
        label1.text = item.day
        img1.image = UIImage(named: "img1")
        label2.text = String(item.low)
        label3.text = "\(item.high)"
        img2.drawRect(startColor: .blue, endColor: .red)
    }
}
