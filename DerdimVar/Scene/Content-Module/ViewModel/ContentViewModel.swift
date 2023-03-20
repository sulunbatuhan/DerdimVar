//
//  ContentViewModel.swift
//  DerdimVar
//
//  Created by batuhan on 5.02.2023.
//

import Foundation
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore

class ContentViewModel {
    func postShare(title:String,text:String,completion:@escaping (Bool)->()){
        guard let currentUser = Auth.auth().currentUser?.uid else {return}
        let eklenecekDert = ["kullaniciID" : currentUser,
                             "kullaniciDertBaslik": title,
                             "kullaniciDertContent":text,
                             "paylasimTarih":Timestamp(date: Date())] as [String:Any]
        
            var ref : DocumentReference? = nil
        ref = Firestore.firestore().collection("Posts").document(currentUser).collection("DertPaylasimlari").addDocument(data: eklenecekDert){error in
            if error != nil {
                return
            }
            print("başarı ile kaydedildi")
        }
    }
}
