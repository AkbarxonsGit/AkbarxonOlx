//
//  SubCategoryViewController.swift
//  First project
//
//  Created by Akbarkhon Akramov on 26/12/23.
//

import UIKit

final class SubCategoryViewController: UIViewController {
    
    // MARK: Data
    private let subCategoryName: String
    private let iconName: String
    let cellTitleLabel = UILabel()
    
    private let tableView = UITableView()
    
    init(iconName: String, subCategoryName: String) {
        self.subCategoryName = subCategoryName
        self.iconName = iconName
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        tableView.frame = view.frame
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SubCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 9 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let subcell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath
        ) as? SubCateoryCellView else { return UITableViewCell() }
        
        subcell.backgroundColor = indexPath.row == 0 ? .red : . green
        subcell.subcategoryLabel.text = indexPath.row == 0 ? "Все в Детский мир" : "Детский мир"
        subcell.subcategoryInfo.text = indexPath.row == 0 ? "634123 результатов": "44123 результатов"
        subcell.subImage.image = indexPath.row == 0 ? UIImage(named: ""): UIImage(named: "arrow")
        subcell.selectionStyle = .none
        
        return subcell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 100 }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 70 }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        let circleViewImage = UIView()
        let categoryLabel = UILabel()
        
        view.addSubview(circleViewImage)
        circleViewImage.frame = .init(x: 15, y: 10, width: 80, height: 80)
        circleViewImage.layer.cornerRadius = 40
        circleViewImage.backgroundColor = .rgb(255, 206, 50)
        
        let icon = UIImageView(image: UIImage(named: iconName))
        view.addSubview(icon)
        icon.frame = .init(x: 18, y: 14, width: 70, height: 70)
        
        view.addSubview(categoryLabel)
        categoryLabel.text = "Детский мир"
        categoryLabel.font = UIFont.boldSystemFont(ofSize: 16)
        categoryLabel.frame = .init(x: 120, y: 35, width: 140, height: 20)
        
        
        view.backgroundColor = .rgb(253, 246, 222)
        
        
        
        return view
    }
    
}
