//
//  SecondViewController.swift
//  First project
//
//  Created by Akbarkhon Akramov on 20/12/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    var successful = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemGreen
        
        
        // success
        
        view.addSubview(successful)
        successful.frame = CGRect(x: 100, y: 400, width: 300, height: 50)
        successful.text = "Yay, you successfully logged in!"
        successful.textColor = UIColor.systemBlue
    }
}
