//
//  TableViewHeader.swift
//  DerdimVar
//
//  Created by batuhan on 5.02.2023.
//

import UIKit

protocol HeaderProtocol{
    func showArticle()
    func showFollowers()
    func showFollowing()
}

final class ProfileHeader: UITableViewHeaderFooterView{

    static let identifier = "header"
    
    var delegate : HeaderProtocol?
    
    let userImage : UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 40
        img.image = UIImage(named: "profile")
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
       
        return img
    }()
    
    let lblUsername : UILabel = {
       let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 28)
        lbl.text = "sulunbatuhan"
        return lbl
    }()
    
    
    let articleCount : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Article Count\n30", for: .normal)
        let attrText = NSMutableAttributedString(string: "Article Count\n",attributes: [.font : UIFont.boldSystemFont(ofSize: 15),.foregroundColor : UIColor.darkGray])
        attrText.append(NSAttributedString(string: "30",attributes: [.font:UIFont.boldSystemFont(ofSize: 15)]))
        btn.setAttributedTitle(attrText, for: .normal)
        btn.tintColor = .darkGray
        btn.titleLabel?.numberOfLines = 0
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(self, action: #selector(showArticle), for: .touchUpInside)
        return btn
    }()
    
    let followers : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Followers\n30", for: .normal)
        let attrText = NSMutableAttributedString(string: "Followers\n",attributes: [.font : UIFont.boldSystemFont(ofSize: 15),.foregroundColor : UIColor.darkGray])
        attrText.append(NSAttributedString(string: "30",attributes: [.font:UIFont.boldSystemFont(ofSize: 15)]))
        btn.setAttributedTitle(attrText, for: .normal)
        btn.tintColor = .darkGray
        btn.titleLabel?.numberOfLines = 0
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(self, action: #selector(showFollowers), for: .touchUpInside)
        return btn
    }()
    
    let following : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Following\n30", for: .normal)
        let attrText = NSMutableAttributedString(string: "Following\n",attributes: [.font : UIFont.boldSystemFont(ofSize: 15),.foregroundColor : UIColor.darkGray])
        attrText.append(NSAttributedString(string: "30",attributes: [.font:UIFont.boldSystemFont(ofSize: 15)]))
        btn.setAttributedTitle(attrText, for: .normal)
        btn.tintColor = .darkGray
        btn.titleLabel?.numberOfLines = 0
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(self, action: #selector(showFollowing), for: .touchUpInside)
        return btn
    }()

    
    @objc  func showFollowers(){
        delegate?.showFollowers()
        print("followers")
    }
    @objc func showFollowing(){
        delegate?.showFollowing()
    }
    @objc  func showArticle(){
        delegate?.showArticle()
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubview(userImage)
        addSubview(lblUsername)
      

        userImage.anchor(top: topAnchor, bottom: nil, leading: nil, trailing: nil, paddingTop: 10, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 80, height: 80)
        userImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        lblUsername.anchor(top: userImage.bottomAnchor, bottom: nil, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 20, paddingBottom: 20, paddingLeft: 30, paddingRight: -30, width: 0, height: 40)
        
        let stackView = UIStackView(arrangedSubviews: [articleCount,followers,following])
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        addSubview(stackView)
        
        stackView.anchor(top: stackView.bottomAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 20, paddingBottom: -20, paddingLeft: 10, paddingRight: -10, width: 0, height: 70)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
        
    
    
}

