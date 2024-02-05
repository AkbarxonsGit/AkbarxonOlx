//
//  TableView.swift
//  First project
//
//  Created by Akbarkhon Akramov on 24/12/23.
//

import UIKit

final class TableView: UIViewController {
    
    private let viewtable = UITableView()
    
    let titleView = UIView()
    let titleLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        title = "Категории"
        
        view.backgroundColor = .white
        
        tableViewFunc()
        leftBarButtonFunc()
        
        
    }
    @objc private func leftButtonTapped() {
        dismiss(animated: true)
    }
}

extension TableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 5 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell( withIdentifier: "cell", for: indexPath
        ) as? CategoryCell else { return UITableViewCell()  }
        
        cell.cellView.backgroundColor = indexPath.row == 0 ? .white : .rgb(253, 246, 222)
        cell.titleLabel.text = indexPath.row == 0 ? "Все обявления" : "Детский мир"
        cell.resultLabel.text = indexPath.row == 0 ? "634123 результатов" : "44123 результатов"
        cell.arrowView.image = indexPath.row == 0 ? UIImage(named: ""): UIImage(named: "arrow")
        cell.image.backgroundColor = indexPath.row == 0 ? .rgb(0, 47, 52) : .rgb(255, 206, 50)
        cell.selectionStyle = .none
        cell.image.image = indexPath.row == 0 ? UIImage(named: "olxCircle") : UIImage(named: "kalyaska")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 100 }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subCategoryVC = SubCategoryViewController(iconName: "kalyaska", subCategoryName: "Tuzikov")
        navigationController?.pushViewController(subCategoryVC, animated: true)
    }
    
    func leftBarButtonFunc() {
        let leftButton = UIBarButtonItem(
            title: "Отмена", style: .plain, target: self, action: #selector(leftButtonTapped))
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.leftBarButtonItem?.tintColor = .systemGray
    }
    
    func tableViewFunc() {
        view.addSubview(viewtable)
        viewtable.frame = view.frame
        viewtable.register(CategoryCell.self, forCellReuseIdentifier: "cell")
        viewtable.delegate = self
        viewtable.dataSource = self
        viewtable.separatorStyle = .none
        viewtable.contentInset = UIEdgeInsets(top: 5, left: 14, bottom: 5, right: -28)
    }
}


