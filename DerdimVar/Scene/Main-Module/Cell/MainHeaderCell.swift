//
//  MainHeaderCell.swift
//  DerdimVar
//
//  Created by batuhan on 6.02.2023.
//

import UIKit

class MainHeaderCell: UICollectionViewCell {
    
    
    let tagList : UILabel = {
       let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.text = "Gundem"
        return lbl
        
    }()
    
    let subView : UIView = {
       let view = UIView()
        view.backgroundColor = .green
        view.isHidden = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tagList)
        addSubview(subView)
        tagList.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
        subView.anchor(top: nil, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 3)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
