//
//  ChatHereVC.swift
//  First project
//
//  Created by Akbarkhon Akramov on 07/01/24.
//



import UIKit

struct ChatData {
    enum Direction {
        case left
        case right
        
    }
    
    let direction: Direction
    let message: String
    let time: String
}

class ChatHereVC : UIViewController {
    
    private let tableView = UITableView()
    private let viewInBackOfTF = UIView()
    private let sendButton = UIButton(type: .infoLight)
    private let tf = PaddingAddedTF()
    
     
    
    var chatData: [ChatData] = [
        ChatData(direction: .left, message: "Hey", time: "17:06"),
        ChatData(direction: .right, message: "Hello", time: "17:07"),
        ChatData(direction: .left, message: "How are you?", time: "17:07"),
        ChatData(direction: .right, message: "I am good thanks, what about you?", time: "17:08"),
        ChatData(direction: .left, message: "Doing great", time: "17:09"),
        ChatData(direction: .right, message: "What news?", time: "17:09"),
        ChatData(direction: .left, message: "I bought myself a brand new BMW M5 CS 😎", time: "17:10"),
        ChatData(direction: .right, message: "Wow 😮🔥, congratulaions!!!", time: "17:11"),
        ChatData(direction: .left, message: "😎", time: "17:11"),
        ChatData(direction: .right, message: "🔥", time: "17:11"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Chat"
        sendFunc()
        backView()
        textFieldFunc()
        tableviewFunc()
        cancelButton()
    }
    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc func sendButtonTapped() {
            if let sms = tf.text, !sms.isEmpty {
                chatData.append(.init(direction: .right, message: sms, time: "anytime"))
                tableView.reloadData()
                tf.text = ""
            }
        }
    
    func cancelButton() {
        let leftButton = UIBarButtonItem(title: "Отмена", style: .plain, target: self, action: #selector(cancelButtonTapped))
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.leftBarButtonItem?.tintColor = .systemGray
    }
    func tableviewFunc() {
        
        view.addSubview(tableView)
        
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 100)
        tableView.register(ChatCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
     //   tableView.estimatedRowHeight = 44
        tableView.separatorStyle = .none
        
    }
    func textFieldFunc() {
        view.addSubview(tf)
        tf.frame = CGRect(x: 16, y: view.frame.height - 90 , width: view.frame.width - 32, height: 50)
        tf.backgroundColor = .systemGray5
        tf.layer.cornerRadius = 12
        tf.placeholder = "Write somethig..."
    }
    func backView() {
        view.addSubview(viewInBackOfTF)
        
        viewInBackOfTF.frame = CGRect(x: 0, y: view.frame.height - 100 , width: view.frame.width, height: 100)
        viewInBackOfTF.backgroundColor = .systemBackground
    }
    func sendFunc() {
        
        tf.addSubview(sendButton)
        sendButton.frame = CGRect(x: 350, y: 5, width: 40 , height: 40)
        sendButton.layer.cornerRadius = 7
        sendButton.backgroundColor = .white
        sendButton.setImage(UIImage(named: "UpArrow"), for: .normal)
       // sendButton.tintColor = .white
        sendButton.addTarget(self, action: #selector(sendButtonTapped) , for: .touchUpInside )
        
    }

}

extension ChatHereVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { chatData.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ChatCell
        else { return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)}
        
        
        
        let data = chatData[indexPath.row]
        
        cell.selectionStyle = .none
        
        
        cell.configure(data: data)
        
        return cell
    }
    
}

class PaddingAddedTF: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 60)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

