//
//  forgotpasswordView.swift
//  First project
//
//  Created by Akbarkhon Akramov on 21/12/23.
//

import UIKit

class forgotpasswordView: UIViewController {
    
    var forgotpassword = UILabel()
    var okasi = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(forgotpassword)
        forgotpassword.frame = CGRect(x: 120, y: 200, width: 300, height: 100)
        forgotpassword.text = "Change your password here!"
        forgotpassword.textColor = UIColor.systemBlue
        
        
        
        view.addSubview(okasi)
        okasi.frame = CGRect(x: 50, y: 300, width: 350, height: 100)
        okasi.backgroundColor = .systemOrange
        okasi.layer.cornerRadius = 25
        
    }
    
}


