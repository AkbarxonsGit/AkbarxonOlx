//  CategoryCell.swift
//  First project
//  Created by Akbarkhon Akramov on 25/12/23.

import UIKit

final class CategoryCell: UITableViewCell {
    let titleLabel = UILabel()
    let resultLabel = UILabel()
    let cellView = UIView()
    let image = UIImageView()
    let arrowView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        categoryFunc()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func categoryFunc() {
        contentView.addSubview(cellView)
        cellView.addSubview(titleLabel)
        cellView.addSubview(image)
        cellView.addSubview(resultLabel)
        cellView.addSubview(arrowView)
        
        
        titleLabel.frame = CGRect(x: 106, y: 20, width: 200, height: 20)
        image.frame = CGRect(x: 15 , y: 15, width: 60, height: 60)
        image.layer.cornerRadius = 30
        image.backgroundColor = .rgb(255, 206, 55)
        resultLabel.frame = CGRect(x: 106, y: 45, width: 200, height: 20)
        resultLabel.font = .systemFont(ofSize: 12)
        resultLabel.textColor = .systemGray
        arrowView.frame = CGRect(x: 350 , y: 30, width: 26, height: 26)
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 5).isActive = true
        cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -30).isActive = true
        cellView.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 5).isActive = true
        cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -5).isActive = true
        
        
    }
}
