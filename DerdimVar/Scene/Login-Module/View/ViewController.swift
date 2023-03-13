//
//  ViewController.swift
//  DerdimVar
//
//  Created by batuhan on 17.10.2022.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
   
    let txtEmail : UITextField = {
       let txt = UITextField()
        txt.placeholder = "Email"
        return txt
    }()
    
    let txtPassword : UITextField = {
       let txt = UITextField()
        txt.placeholder = "Email"
        return txt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        view.addSubview(txtEmail)
        view.addSubview(txtPassword)
    }
    
    override func viewDidLayoutSubviews() {
        
      let stackView = UIStackView(arrangedSubviews: [txtEmail,txtPassword])
        stackView.axis = .vertical
        stackView.alignment = .center
        
        
        stackView.anchor(top: <#T##NSLayoutYAxisAnchor?#>, bottom: <#T##NSLayoutYAxisAnchor?#>, leading: <#T##NSLayoutXAxisAnchor?#>, trailing: <#T##NSLayoutXAxisAnchor?#>, paddingTop: <#T##CGFloat#>, paddingBottom: <#T##CGFloat#>, paddingLeft: <#T##CGFloat#>, paddingRight: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    @IBAction func tappedLogin(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text  else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                self.alertMessage(title: "Hata", message: "Email yada şifre yanlış")
            }
            let kullaniciAdi = result?.user.uid
            print(kullaniciAdi)
            self.performSegue(withIdentifier: "ToMain", sender: nil)
        }
        
        
    }
    
    
    
    
    
    
}

