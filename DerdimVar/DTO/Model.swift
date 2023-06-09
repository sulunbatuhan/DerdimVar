//
//  Model.swift
//  DerdimVar
//
//  Created by batuhan on 2.11.2022.
//

import Foundation
import Firebase
import UIKit

struct Post {

    let userID : String?
    let title : String?
    let text : String?
    let date : Timestamp?
    
    init(postData : [String:Any]) {
      
        self.userID = postData["userID"] as? String
        self.title = postData["title"] as? String
        self.text = postData["text"] as? String
        self.date = postData["date"] as? Timestamp
    }
}



struct User {
    let userID : String
    let username : String
    let userImage : String
    
    init(userData : [String:Any]) {
        self.userID = userData["userID"] as? String ?? ""
        self.username = userData["username"] as? String ?? ""
        self.userImage = userData["userImage"] as? String ?? ""
    }
}

