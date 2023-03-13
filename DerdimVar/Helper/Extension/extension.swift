//
//  extension.swift
//  DerdimVar
//
//  Created by batuhan on 18.10.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func alertMessage(title : String,message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "OK", style: .default)
        alert.addAction(confirm)
        present(alert, animated: true)
    }
    
}

extension UIViewController {
    
    public func alertSystem(){
        let alert = UIAlertController()
    }
}
