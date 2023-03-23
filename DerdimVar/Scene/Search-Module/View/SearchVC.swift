//
//  SearchVC.swift
//  DerdimVar
//
//  Created by batuhan on 18.11.2022.
//

import UIKit
import JGProgressHUD
import FirebaseDatabase

 class SearchVC: UICollectionViewController{

    private let searchBar : UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.placeholder = "Search Something"
        searchBar.becomeFirstResponder()
        return searchBar
    }()
    
    
     let backgroundNote : UILabel = {
        let lbl = UILabel()
         lbl.text = "Burası boş gözüküyor"
         lbl.textAlignment = .center
         lbl.numberOfLines = 0
         lbl.textColor = .gray
         return lbl
     }()

    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionViewSettings()
    }
   
    override func viewDidLayoutSubviews() {
        SearchBarSettings()
    }
    
     fileprivate  func fetchUser(){
         
     }
     
     
     private func SearchBarSettings(){
         navigationController?.navigationBar.addSubview(searchBar)
         let navBar = navigationController?.navigationBar
     searchBar.anchor(top: navBar?.topAnchor, bottom: navBar?.bottomAnchor, leading: navBar?.leadingAnchor, trailing: navBar?.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 10, paddingRight: -10, width: 0, height: 0)
     }
     
     
     private func CollectionViewSettings(){
         collectionView.register(SearchCollectionCell.self, forCellWithReuseIdentifier: SearchCollectionCell.reuseIdentifier)
         collectionView.alwaysBounceVertical = true
         collectionView.keyboardDismissMode = .onDrag
        
         
        
         
         //collectionView.addSubview(backgroundNote)
         collectionView.addSubview(backgroundNote)
         backgroundNote.isHidden = true
         backgroundNote.anchor(top: collectionView.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: nil, trailing: nil, paddingTop: 80, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 80, height: 80)
         backgroundNote.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
         
         
         
     }
     
     
     
     var filter : Int = 0
}





//MARK: UICOLLECTION
extension SearchVC : UICollectionViewDelegateFlowLayout{
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if filter == 0{
            backgroundNote.isHidden = false
        }
        return filter
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionCell.reuseIdentifier, for: indexPath) as! SearchCollectionCell
        
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("basildi")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}


extension SearchVC : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
          
        }else {
           
        }
    }
}
