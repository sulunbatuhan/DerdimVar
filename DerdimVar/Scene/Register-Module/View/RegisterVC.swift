//
//  RegisterVC.swift
//  DerdimVar
//
//  Created by batuhan on 18.10.2022.
//

import UIKit
import Firebase
final class RegisterVC: UIViewController {
    
    @IBOutlet weak var registerEmail: UITextField!
    @IBOutlet weak var emailConfirm: UITextField!
    @IBOutlet weak var registerPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    // MARK: - Navigation
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        
        if let email =  registerEmail.text , let password = registerPassword.text{
           /* DatabaseManager.shared.userExists(email: email) { exist in
                guard !exist else {
                    // kullanıcı var
                    // alert
                }*/
                
                Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
                    if error != nil {
                        self!.alertMessage(title: "Hata", message: "Hatalı kayıt")
                    }
                    //DatabaseManager.shared.addUser(user: User(username: <#T##String#>, email: email))
                    self!.dismiss(animated: true)
                }
            }
            
            
        }
        //
        
        
        
    }

