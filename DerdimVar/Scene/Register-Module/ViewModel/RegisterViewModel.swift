//
//  RegisterViewModel.swift
//  DerdimVar
//
//  Created by batuhan on 15.03.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel {
    func saveUser(username:String,email:String,password:String,completion:@escaping((Bool))->()){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil{
                completion(false)
                return
            }
            guard let createdUser = authResult?.user.uid else {return}
            let saveData : [String:Any] = ["username":username,"userID":createdUser]
            
            Firestore.firestore().collection("Users").document(createdUser).setData(saveData){
                error in
                if error != nil {
                    completion(false)
                    return
                }
                else {
                completion(true)
                }
            }
        }
    }
}
