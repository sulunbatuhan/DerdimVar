//
//  MainViewController.swift
//  DerdimVar
//
//  Created by batuhan on 2.11.2022.
//

import UIKit
import FirebaseFirestore
import Firebase
import JGProgressHUD

class MainViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    let refreshControl = UIRefreshControl()
    
    var posts = [Post]()
    
    override func viewDidLoad() {
 
        NotificationCenter.default.addObserver(self, selector: #selector(update), name: ContentVC.updateNotification, object: nil)
        
        navigationSettings()
        collectionViewSettings()
        fetchData()
    }
    
    
    
    @objc private func messageBox(){
        
        
       let messageVC = MessageVC()
        messageVC.modalPresentationStyle = .fullScreen
        present(messageVC, animated: true)
        
       
    }
    
    
    @objc private func update(){
    }
    
    
    
    @objc private func refresh(){
        self.refreshControl.beginRefreshing()
        fetchData()
        
    }
    
    fileprivate func fetchData(){
         
         guard let currentUser = Auth.auth().currentUser?.uid else {return}
        DispatchQueue.main.async {
            
            
            Firestore.firestore().collection("Posts").document(currentUser).collection("dertler").addSnapshotListener{ snapshot, error in
              
                if error != nil {
                    return
                }
                snapshot?.documentChanges.forEach({ change in
                    if change.type == .added{
                        let veri = change.document.data()
                        var post = Post(postData: veri)
                        self.posts.append(post)
                        
                    }
                })
                self.posts.reversed()
                self.collectionView.reloadData()
                self.refreshControl.endRefreshing()
              
            }
        }
         
    }
    
    private func navigationSettings(){
        navigationItem.title = "Ana Sayfa"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "message"), style: .done, target: self, action: #selector(messageBox))
        navigationItem.rightBarButtonItem?.tintColor = .black
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh), for: .touchUpInside)
    }
    
    private func collectionViewSettings(){
        collectionView.register(HashtagListHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCell")
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        
    }
    
    
    
    
}


//MARK: CollectionViewController
extension MainViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
        
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
        
        cell.post = posts[indexPath.row]
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
        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 120)
        let geciciCel = MainCollectionViewCell(frame: frame)
        geciciCel.layoutIfNeeded()
        let hedefBoyut = CGSize(width: view.frame.width, height: 200)
        let tahminiBoyut = geciciCel.systemLayoutSizeFitting(hedefBoyut)
        let yukseklik = max(120, tahminiBoyut.height)
        return CGSize(width: view.frame.width, height:yukseklik)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let detail = DetailVC()
        detail.post = posts[indexPath.row]
        detail.modalPresentationStyle  = .fullScreen
        detail.modalTransitionStyle = .crossDissolve
        navigationController?.pushViewController(detail, animated: true)

    }
}

extension MainViewController : DetailVCDelegate {
    func pressLikeButton(post: Post) {
        
    }
    
    func pressDislikeButton(post: Post) {
        
    }
    
    
}
