//
//  ProfileVC.swift
//  DerdimVar
//
//  Created by batuhan on 13.11.2022.
//

import UIKit
import FirebaseAuth
import Firebase

class ProfileVC: UITableViewController , HeaderProtocol{
   
    var userProfile : User?
    
    var posts = [Post]()
    var followersArr : [String] = ["ahmet","mehmet","batuhan"]
    lazy var profileViewModel = ProfileViewModel()
    
    var artBool : Bool = true
    var following : Bool = false
    var followers : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileHeader.self, forHeaderFooterViewReuseIdentifier: ProfileHeader.identifier)
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.identifier)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:UIImage(systemName: "gearshape"), style: .done, target: self, action: #selector(signOut))
        navigationItem.rightBarButtonItem?.tintColor = .black
        fetchData()
        
    }
    
    
    fileprivate func fetchData(){
        
        guard let currentUser = Auth.auth().currentUser?.uid else {return}
        DispatchQueue.main.async {
            
            
            Firestore.firestore().collection("Posts").document(currentUser).collection("dertler").addSnapshotListener{ snapshot, error in
                self.tableView.refreshControl?.endRefreshing()
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
                self.tableView.reloadData()
            }
        }
        
    }
    
    
    @objc func signOut(){
         let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
         let signOut = UIAlertAction(title: "Oturumu Kapat", style: .destructive){_ in
         do {
         try Auth.auth().signOut()
         self.navigationController?.popToRootViewController(animated: true)
         self.dismiss(animated: true)
         }catch{
         
         }
         
         }
         let keepContinue = UIAlertAction(title: "Devam Et", style: .default)
         alertController.addAction(signOut)
         alertController.addAction(keepContinue)
         self.present(alertController, animated: true)
         
         
         }
        
      
        
    
}
extension ProfileVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count : Int = 0
        
        if artBool == true,following == false {
          count = posts.count
         
        }
        else if following == true,artBool == false{
           count = followersArr.count
            print(followersArr.count)
        }
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for:indexPath) as! ProfileCell
        if following == true {
            let row = followersArr[indexPath.row]
            cell.textLabel?.text = row
            print(row)
            return cell
        }
        let row = posts[indexPath.row]
        cell.textLabel?.text = row.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeader.identifier) as! ProfileHeader
        header.delegate = self
        return header
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if artBool == true,following == false {
            let detail = DetailVC()
             detail.post = posts[indexPath.row]
             detail.modalPresentationStyle  = .fullScreen
             detail.modalTransitionStyle = .crossDissolve
             navigationController?.pushViewController(detail, animated: true)
        }else if artBool == false,following == true {
            let userProfile = ProfileVC()
           
            userProfile.modalTransitionStyle = .crossDissolve
            userProfile.modalPresentationStyle = .fullScreen
            
            navigationController?.pushViewController(userProfile, animated: true)
        }
        
     
    }
    
    fileprivate func getUser(){
        guard  let gecerliKullaniciID = Auth.auth().currentUser?.uid else {return}
    }
    
 func showArticle() {
        artBool = true
        following = false
        followers = false
        print("SHOWARTİCLE")
        print(following)
     self.tableView.reloadData()
    }
    
    func showFollowers() {
        artBool = false
        following = false
        followers = true
        print("SHOWARTİCLE")
        self.tableView.reloadData()

    }
    
    func showFollowing() {
        artBool = false
        following = true
        followers = false
        print("SHOWARTİCLE")
        self.tableView.reloadData()

    }
    
}


