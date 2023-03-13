//
//  ProfileVC.swift
//  DerdimVar
//
//  Created by batuhan on 13.11.2022.
//

import UIKit
import FirebaseAuth
import Firebase

class ProfileVC: UITableViewController {

   
  
    lazy var profileViewModel = ProfileViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileHeader.self, forHeaderFooterViewReuseIdentifier: ProfileHeader.identifier)
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.identifier)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Çıkış Yap", style: .done, target: self, action: #selector(signOut))
        navigationItem.rightBarButtonItem?.tintColor = .black
       
    }
    


    
    @objc func signOut(){
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
       
        
        let signOut = UIAlertAction(title: "Oturumu Kapat", style: .destructive){_ in
            //Auth.auth().signOut()
        }
        let keepContinue = UIAlertAction(title: "Devam Et", style: .default)
        alertController.addAction(signOut)
        alertController.addAction(keepContinue)
        present(alertController, animated: true)
        
        
    }
}

extension ProfileVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for:indexPath) as! ProfileCell
        cell.lbl.text = "ayarlar"
        cell.textLabel?.text = "ayatlar2"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeader.identifier)
        header?.backgroundColor = .lightGray
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
