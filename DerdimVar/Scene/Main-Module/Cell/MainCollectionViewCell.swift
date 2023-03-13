//
//  MainTableCell.swift
//  DerdimVar
//
//  Created by batuhan on 13.11.2022.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {

  static let identifier = "Cell"
    
    
    let userImage : UIImageView = {
       let img = UIImageView()
        img.backgroundColor = .systemPink
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 15
        img.image = UIImage(named: "profile")
        img.clipsToBounds = true
        return img
    }()
    
    let lblUsername : UILabel = {
       let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.text = "sulunbatuhan"
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        return lbl
    }()
    let titleLabel : UILabel = {
       let lbl = UILabel()
        lbl.text = "bu bir deneme yazısıdır.Deneme yazısı test test yazısı farketmez."
        lbl.textAlignment = .natural
        lbl.numberOfLines = 2
        
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.tintColor = .systemGray2
        return lbl
    }()
    
    let textLabel : UILabel = {
       let lbl = UILabel()
        lbl.text = "bu bir deneme yazısıdır.Deneme yazısı test yazısı farketmez."
        lbl.numberOfLines = 3
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.tintColor = .systemGray2
        return lbl
    }()
    
    let view : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        addSubview(userImage)
        addSubview(lblUsername)
        addSubview(titleLabel)
        addSubview(textLabel)
        addSubview(view)
        userImage.anchor(top: topAnchor, bottom: nil, leading: leadingAnchor, trailing: nil, paddingTop: 10, paddingBottom: 0, paddingLeft: 20, paddingRight: 0, width: 30, height: 30)
        lblUsername.anchor(top: topAnchor, bottom: nil, leading: userImage.trailingAnchor, trailing: trailingAnchor, paddingTop: 10, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 30)
        titleLabel.anchor(top: userImage.bottomAnchor, bottom: textLabel.topAnchor, leading: userImage.leadingAnchor, trailing: trailingAnchor, paddingTop: 8, paddingBottom: -8, paddingLeft: 0, paddingRight: -20, width: 0, height: 0)
        textLabel.anchor(top: titleLabel.bottomAnchor, bottom: view.topAnchor, leading: userImage.leadingAnchor, trailing: trailingAnchor, paddingTop: 0, paddingBottom: -8, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
        view.anchor(top: nil, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 0, paddingBottom: 1, paddingLeft: 0, paddingRight: 0, width: 0, height: 1)
    }
    
    
}
