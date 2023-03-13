//
//  TableViewHeader.swift
//  DerdimVar
//
//  Created by batuhan on 5.02.2023.
//

import UIKit

final class ProfileHeader: UITableViewHeaderFooterView{

    static let identifier = "header"
    
    
    let userImage : UIImageView = {
       let img = UIImageView()
        img.layer.cornerRadius = 50
        img.image = UIImage(named: "profile")
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let lblUsername : UILabel = {
       let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 28)
        lbl.text = "sulunbatuhan"
        return lbl
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubview(userImage)
        addSubview(lblUsername)
        userImage.anchor(top: topAnchor, bottom: nil, leading: nil, trailing: nil, paddingTop: 10, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 100, height: 100)
        userImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        lblUsername.anchor(top: userImage.bottomAnchor, bottom: nil, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 20, paddingBottom: 20, paddingLeft: 30, paddingRight: -30, width: 0, height: 50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
