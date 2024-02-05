//
//  SubCateoryCellView.swift
//  First project
//
//  Created by Akbarkhon Akramov on 27/12/23.
//

import UIKit

final class SubCateoryCellView: UITableViewCell {
    
    let subcategoryLabel = UILabel()
    let subcategoryInfo = UILabel()
    let subCellView = UIView()
    let subImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        subcategoryCellFunc()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func subcategoryCellFunc() {
        contentView.addSubview(subCellView)
        subCellView.addSubview(subImage)
        subCellView.addSubview(subcategoryInfo)
        subCellView.addSubview(subcategoryLabel)
        
        subcategoryLabel.frame = CGRect(x: 15, y: 15, width: 130, height: 20)
        subcategoryInfo.frame = CGRect(x: 15, y: 45, width: 100, height: 15)
        subcategoryInfo.font = .systemFont(ofSize: 12)
        subcategoryInfo.textColor = .systemGray
        subImage.frame = CGRect(x: 350, y: 30, width: 26, height: 26)
        
        
        subCellView.translatesAutoresizingMaskIntoConstraints = false
        subCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 5).isActive = true
        subCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -30).isActive = true
        subCellView.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 5).isActive = true
        subCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -5).isActive = true
        
    }
}
