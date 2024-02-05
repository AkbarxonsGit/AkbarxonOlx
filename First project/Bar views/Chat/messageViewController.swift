//
//  messageViewController.swift
//  First project
//
//  Created by Akbarkhon Akramov on 25/12/23.
//

import UIKit


class messageViewController: UIViewController {
    
    let ChatButton = UIButton(type: .system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(ChatButton)
        view.backgroundColor = .white
        
        ChatButton.frame = CGRect(x: 40, y: 400, width: view.frame.width - 80, height: view.frame.height - 800)
        ChatButton.setTitle("Chat Now", for: .normal)
        ChatButton.backgroundColor = .rgb(0, 47, 52)
        ChatButton.addTarget(self, action: #selector(buttonTappped), for: .touchUpInside)
        ChatButton.setTitleColor(.white, for: .normal)
        ChatButton.layer.cornerRadius = 15
        ChatButton.setTitleShadowColor(.systemGray3, for: .normal)
        ChatButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        
    }
    @objc func buttonTappped() {
        let ChatVC = ChatHereVC()
        let ChatChatVC = UINavigationController(rootViewController: ChatVC)
        ChatChatVC.modalPresentationStyle = .fullScreen
        present(ChatChatVC, animated: true)
    }
}


