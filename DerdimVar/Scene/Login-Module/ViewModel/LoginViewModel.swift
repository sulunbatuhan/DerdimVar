//
//  LoginViewModel.swift
//  DerdimVar
//
//  Created by batuhan on 13.03.2023.
//

import Foundation
import FirebaseAuth



class LoginViewModel {
    func singIn(email:String,password:String,completion:@escaping (Bool)->()){
        Auth.auth().signIn(withEmail: email, password: password) { autResult, error in
            if error != nil {
                completion(false)
                return
            }
            else {
                completion(true)
                return
            }
        }
    }
}
