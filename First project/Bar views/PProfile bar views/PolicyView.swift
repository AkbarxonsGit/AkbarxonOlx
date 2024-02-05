//
//  PolicyView.swift
//  First project
//
//  Created by Akbarkhon Akramov on 21/12/23.
//

import UIKit

class PolicyView: UIViewController {
    
    var policyText = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(policyText)
        policyText.frame = CGRect(x: 50, y: 400, width: 350, height: 100)
        policyText.text = "Here should the Tems and Services text"
        policyText.textColor = UIColor.systemBlue
    }
}
