//
//  ContentVC.swift
//  DerdimVar
//
//  Created by batuhan on 13.11.2022.
//

import UIKit
import Firebase
import JGProgressHUD

class ContentVC: UIViewController {

    
    //lazy var contentViewModel = ContentViewModel()
    
    static let updateNotification = Notification.Name("update")
    
    let titleTextField : UITextField = {
        let title = UITextField()
        title.placeholder = "Title"
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.textAlignment = .left
        title.borderStyle = .none
        return title
    }()
    
    let contentTextView : UITextView = {
        let content =  UITextView()
        content.font = UIFont.systemFont(ofSize: 15)
        return content
    }()
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.rightBarButtonItem?.isEnabled = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "pencil"), style: .done, target: self, action: #selector(shareButton))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationSettings()
       
    }
    
    override func viewDidLayoutSubviews() {
       layoutSettings()
    }
    
    
    
    private func navigationSettings(){
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .white
        //navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "pencil"), style: .done, target: self, action: #selector(shareButton))
        //navigationItem.rightBarButtonItem?.tintColor = .black
       navigationItem.title = "Derdim Var"
    }
    
    private func layoutSettings(){
        view.addSubview(titleTextField)
       view.addSubview(contentTextView)
        titleTextField.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 30, paddingBottom: 0, paddingLeft: 30, paddingRight: -30, width: 0, height: 40)
        contentTextView.anchor(top: titleTextField.bottomAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 20, paddingBottom: 0, paddingLeft: 30, paddingRight: -30, width: 0, height: 0)
        
    }
    
 
   
    
    @objc func shareButton(){
        
        let hud = JGProgressHUD(style: .light)
       
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        guard let title = self.titleTextField.text, title.count > 0,!title.isEmpty else {return}
        guard let text = self.contentTextView.text, text.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 else {return}
        hud.textLabel.text = "Gönderiliyor"
        hud.show(in: self.contentTextView)
        
        guard let currentUser = Auth.auth().currentUser?.uid else {return}
        
        let eklenecekVeri = ["userID":currentUser,
                             "title":title,
                             "text":text,
                             "date":Timestamp(date: Date())] as [String:Any]
        
        var ref : DocumentReference? = nil
        
        ref = Firestore.firestore().collection("Posts").document(currentUser).collection("dertler").addDocument(data: eklenecekVeri){
            error in
            if error != nil {
                hud.indicatorView = JGProgressHUDErrorIndicatorView()
                hud.textLabel.text = "Hata"
                hud.detailTextLabel.text = "İçerik gönderilemedi"
                hud.show(in: self.contentTextView)
                return
            }
            
            NotificationCenter.default.post(name: ContentVC.updateNotification, object: nil)
            
            hud.indicatorView = JGProgressHUDSuccessIndicatorView()
            hud.textLabel.text = "Başarıyla gönderildi"
            hud.show(in: self.contentTextView)
            self.titleTextField.text = ""
            self.contentTextView.text = ""
            
        }
        hud.dismiss(afterDelay: 3)
        
       
        
    }
    
    
}
