//
//  ContentViewModel.swift
//  DerdimVar
//
//  Created by batuhan on 5.02.2023.
//

import Foundation
import FirebaseStorage

class ContentViewModel {
    func postShare(title:String,text:String){
        let postId = UUID().uuid
        let post = Post(postData: <#T##[String : Any]#>)
        let ref = Storage.storage().reference(withPath: "/Posts/\(postId)")
        
        ref.putData(re, completion: <#T##((StorageMetadata?, Error?) -> Void)?##((StorageMetadata?, Error?) -> Void)?##(StorageMetadata?, Error?) -> Void#>)
    }
}
