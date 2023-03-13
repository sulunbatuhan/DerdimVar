//
//  DetailVC.swift
//  DerdimVar
//
//  Created by batuhan on 9.02.2023.
//

import UIKit

class DetailVC: UIViewController {

    let imgWriter : UIImageView = {
        let img  = UIImageView()
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .systemPink
        return img
    }()
    
    let nameWriter : UILabel = {
       let wrt = UILabel()
        wrt.text = "sulunbatuhan"
        wrt.font = UIFont.boldSystemFont(ofSize: 14)
        wrt.layer.borderWidth = 1
        return wrt
    }()
    
    
    let postDate : UILabel = {
       let date = UILabel()
        date.text = "2 weeks ago"
        date.layer.borderWidth = 1
        date.font = UIFont.systemFont(ofSize: 10)
        return date
    }()
    
    let likeButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        btn.layer.borderWidth = 1
        btn.tintColor = .black
        return btn
    }()
    
    let dislikeButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    
    let scrollView : UIScrollView = {
       let sv = UIScrollView()
        sv.layer.borderWidth = 1
        sv.alwaysBounceVertical = true
        return sv
        
    }()
    
    let date : UILabel = {
       let date = UILabel()
        date.text = "jkasdhfkjshfkjasfhkjsahfklashfkalsfhkalsjdhfkjasfhkjlasdfhkajsfhkjsahfkjasfklahfklashdflkasjdfhalskdjfhasldkjfhasldkjfhasldkjfhaslkdjfhaslkdjfhalskdjhfaslkjfhasldkjfhalskdjfhasldkjfhasldkjfhasldkfjhasldkjfhasldkjfhaslkdjfhaslkdjfhaslkdjhfalskdjfhalskdjhfalksjdhfalksjdhfalsjdhfalskdjfhaslkjdfhalskdjhflaksjdhflkasjfhljsakdfhasldkjfhasklfj"
        date.backgroundColor = .purple
        date.font = UIFont.systemFont(ofSize: 10)
        return date
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imgWriter)
        view.addSubview(nameWriter)
        view.addSubview(postDate)
        view.addSubview(likeButton)
        view.addSubview(dislikeButton)
        view.addSubview(scrollView)
        
        scrollView.addSubview(date)
      
    }
    override func viewDidLayoutSubviews() {
        imgWriter.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: nil, paddingTop: 20, paddingBottom: 0, paddingLeft: 20, paddingRight: 0, width: 80, height: 80)
        nameWriter.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: imgWriter.trailingAnchor, trailing: likeButton.leadingAnchor, paddingTop: 20, paddingBottom: 0, paddingLeft: 12, paddingRight: -12, width: 0, height: 40)
        postDate.anchor(top: nameWriter.bottomAnchor, bottom: nil, leading: imgWriter.trailingAnchor, trailing: view.trailingAnchor, paddingTop: 8, paddingBottom: 0, paddingLeft: 12, paddingRight: -12, width: 0, height: 20)
        
        likeButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: nameWriter.trailingAnchor, trailing: dislikeButton.leadingAnchor, paddingTop: 20, paddingBottom: 0, paddingLeft: 12, paddingRight: -12, width: 40, height: 40)
        dislikeButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: likeButton.trailingAnchor, trailing: view.trailingAnchor, paddingTop: 20, paddingBottom: 0, paddingLeft: 12, paddingRight: -12, width: 40, height: 40)
        
        
        scrollView.anchor(top: imgWriter.bottomAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 12, paddingBottom: 12, paddingLeft: 12, paddingRight: -12, width: 0, height: 0)
        
        
        date.anchor(top:scrollView.topAnchor , bottom: scrollView.bottomAnchor, leading: scrollView.leadingAnchor, trailing: scrollView.trailingAnchor, paddingTop: 2, paddingBottom: 2, paddingLeft: 2, paddingRight: 2, width: 0, height: 0)
    }
}
