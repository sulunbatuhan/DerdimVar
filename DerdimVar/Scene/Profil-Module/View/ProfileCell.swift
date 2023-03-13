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
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.tintColor = .black
        return lbl
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(lbl)
        lbl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lbl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
