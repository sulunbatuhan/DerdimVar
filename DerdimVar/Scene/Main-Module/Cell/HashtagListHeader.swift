//
//  HashtagListCell.swift
//  DerdimVar
//
//  Created by batuhan on 13.11.2022.
//

import UIKit

class HashtagListHeader: UICollectionReusableView {
   
    static let identifier = "header"
    
    let tagLists = [Categories]()
    let collectionViewHeader : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.register(MainHeaderCell.self, forCellWithReuseIdentifier: "CollectionCell")
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPink
        addSubview(collectionViewHeader)
        collectionViewHeader.delegate = self
        collectionViewHeader.dataSource = self
        collectionViewHeader.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 0, paddingBottom: 10, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension HashtagListHeader {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath)
    
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height:30)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
    }
    
    
}
extension HashtagListHeader : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{}
