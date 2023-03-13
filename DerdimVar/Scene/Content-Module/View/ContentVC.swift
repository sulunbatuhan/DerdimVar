//
//  ContentVC.swift
//  DerdimVar
//
//  Created by batuhan on 13.11.2022.
//

import UIKit

class ContentVC: UIViewController {

    
    lazy var contentViewModel = ContentViewModel()
    
    let titleTextField : UITextField = {
        let title = UITextField()
        title.placeholder = "Title"
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.textAlignment = .left
        title.borderStyle = .none
        return title
    }()
    
    let contentTextView : UITextView = {
        let content =  UITextView()
        content.font = UIFont.systemFont(ofSize: 15)
        return content
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "pencil"), style: .done, target: self, action: #selector(shareButton))
        navigationItem.rightBarButtonItem?.tintColor = .black
       navigationItem.title = "Derdim Var"
    }
    
    override func viewDidLayoutSubviews() {
        view.addSubview(titleTextField)
        view.addSubview(contentTextView)
        titleTextField.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 30, paddingBottom: 0, paddingLeft: 30, paddingRight: -30, width: 0, height: 40)
        contentTextView.anchor(top: titleTextField.bottomAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 20, paddingBottom: 0, paddingLeft: 30, paddingRight: -30, width: 0, height: 0)
    }
    
    @objc func shareButton(){
       // guard let title = titleTextField, let text = contentTextView else {return}
       // contentViewModel.postShare(title: title, text: text)
    }

}
