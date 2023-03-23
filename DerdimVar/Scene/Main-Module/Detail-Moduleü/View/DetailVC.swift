//
//  DetailVC.swift
//  DerdimVar
//
//  Created by batuhan on 9.02.2023.
//

import UIKit


protocol DetailVCDelegate {
    func pressLikeButton(post:Post)
    func pressDislikeButton(post:Post)
}

class DetailVC: UIViewController {
    
    var delegate : DetailVCDelegate?
    
    var post:Post?{
        didSet{
            textView.text = post?.text
            nameWriter.text = post?.userID
        }
    }
    
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
        return wrt
    }()
    
    let postDate : UILabel = {
       let date = UILabel()
        date.text = "2 weeks ago"
        date.font = UIFont.systemFont(ofSize: 10)
        return date
    }()
    
    let likeButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        return btn
    }()
    
    let dislikeButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
        btn.addTarget(self, action: #selector(dislikeButtonPressed), for: .touchUpInside)
        btn.tintColor = .black
        return btn
    }()
    
    let textView : UITextView = {
       let txt = UITextView()
        txt.isEditable = false
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: -80, right: 0)
        return txt
    }()
    
    @objc fileprivate func likeButtonPressed(){
        guard let post = self.post else {return}
        delegate?.pressLikeButton(post:post)
    }
    
    @objc fileprivate func dislikeButtonPressed(){
        guard let post = self.post else {return}
        delegate?.pressDislikeButton(post:post)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(backToTheMain))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        title = "Derdim Var"
        view.backgroundColor = .white
        view.addSubview(imgWriter)
        view.addSubview(nameWriter)
        view.addSubview(postDate)
        view.addSubview(likeButton)
        view.addSubview(dislikeButton)
        view.addSubview(textView)
    }
    
    @objc func backToTheMain(){
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        imgWriter.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: nil, paddingTop: 20, paddingBottom: 0, paddingLeft: 20, paddingRight: 0, width: 80, height: 80)
        nameWriter.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: imgWriter.trailingAnchor, trailing: likeButton.leadingAnchor, paddingTop: 20, paddingBottom: 0, paddingLeft: 12, paddingRight: -12, width: 0, height: 40)
        postDate.anchor(top: nameWriter.bottomAnchor, bottom: nil, leading: imgWriter.trailingAnchor, trailing: view.trailingAnchor, paddingTop: 8, paddingBottom: 0, paddingLeft: 12, paddingRight: -12, width: 0, height: 20)
        likeButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: nameWriter.trailingAnchor, trailing: dislikeButton.leadingAnchor, paddingTop: 20, paddingBottom: 0, paddingLeft: 12, paddingRight: -12, width: 40, height: 40)
        dislikeButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: likeButton.trailingAnchor, trailing: view.trailingAnchor, paddingTop: 20, paddingBottom: 0, paddingLeft: 12, paddingRight: -12, width: 40, height: 40)
        textView.anchor(top: imgWriter.bottomAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 12, paddingBottom: 12, paddingLeft: 12, paddingRight: -12, width: 0, height: 0)
    }
}
