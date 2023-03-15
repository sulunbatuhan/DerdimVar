//
//  MainViewController.swift
//  DerdimVar
//
//  Created by batuhan on 2.11.2022.
//

import UIKit
import FirebaseFirestore
import FirebaseCore

class MainViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

 
    
    
    private var dertlerCollectionRef : CollectionReference!
    
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HashtagListHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCell")
        
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        navigationItem.title = "Ana Sayfa"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "message"), style: .done, target: self, action: #selector(messageBox))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        //dertlerCollectionRef = Firestore.firestore().collection(dertler_REF)
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dertlerCollectionRef.getDocuments { snapshot, error in
            if error != nil {
                debugPrint("kayıtlar getirilemedi",error?.localizedDescription)
                
            }else {
                guard let snap = snapshot else {return}
                for document in snap.documents{
                    
                }
            }
        }
    }
    
    @objc func messageBox(){
        
    }
    
}
//MARK: CollectionViewController
extension MainViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCell", for: indexPath) as! HashtagListHeader
        
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let detail = UINavigationController(rootViewController:  DetailVC())
        detail.modalPresentationStyle  = .fullScreen
        detail.modalTransitionStyle = .crossDissolve
       show(detail, sender: nil)

    }
}
