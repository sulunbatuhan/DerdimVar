//
//  SearchCell.swift
//  DerdimVar
//
//  Created by batuhan on 22.03.2023.
//

import UIKit


class SearchCollectionCell: UICollectionViewCell {
    
    
    static let reuseIdentifier = "searchCell"
    
    
    let cellImage : UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .yellow
        img.layer.cornerRadius = 40/2
        img.clipsToBounds = true
        return img
    }()
    
    let username : UILabel = {
       let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.text = "Batuhan"
        
        return lbl
    }()
    
    
    let seperatorView : UIView = {
       let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setView(){
        addSubview(cellImage)
        addSubview(username)
        addSubview(seperatorView)
        
        cellImage.anchor(top: nil, bottom: nil, leading: leadingAnchor, trailing: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 20, paddingRight: 0, width: 40, height: 40)
        cellImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        username.anchor(top: nil, bottom: nil, leading: cellImage.trailingAnchor, trailing: trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 20)
        username.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        seperatorView.anchor(top: nil, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0.5)
        
    }
   
}
