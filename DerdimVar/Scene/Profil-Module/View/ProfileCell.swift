//
//  ProfileCell.swift
//  DerdimVar
//
//  Created by batuhan on 5.02.2023.
//

import UIKit

class ProfileCell: UITableViewCell {
 static let identifier = "cell"
    
    
    let lbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Ayarlar"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.tintColor = .black
        return lbl
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(lbl)
        lbl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        lbl.anchor(top: nil, bottom: nil, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 20, paddingRight: 20, width: 0, height: 40)
    }
    
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
