//
//  HomeViewController.swift
//  First project
//
//  Created by Akbarkhon Akramov on 25/12/23.
//

import UIKit

final class homeViewController: UIViewController {
    
    let searchBar = PaddedSearchBarField()
    let categoriesView = UIView()
    let categoriesLabel = UILabel()
    let recommendedLabel = UILabel()
    let showAllButton = UIButton(type: .system)
    let searchIcon = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemGray6
        
        searchBarFunc()
        searchBarIconFunc()
        categoriesViewFunc()
        recommendedLabelFunc()        
        
        
    }
    
    @objc func showAllButtonObjc() {
        let vc = TableView()
        let showALlVC = UINavigationController(rootViewController: vc)
        showALlVC.modalPresentationStyle = .fullScreen
        present(showALlVC, animated: true)
    }
    
    func searchBarFunc() {
        view.addSubview(searchBar)
        
        searchBar.frame = CGRect(x: 20, y: 70, width: UIScreen.main.bounds.width - 40, height: 45)
        searchBar.backgroundColor = .white
        searchBar.placeholder = "Поиск"
        searchBar.layer.cornerRadius = 10
        
    }
    func searchBarIconFunc(){
        searchBar.addSubview(searchIcon)
        searchIcon.frame = CGRect(x: 10, y: 13, width: 20, height: 20)
        searchIcon.image = UIImage(named: "searchIcon")
    }
    func categoriesViewFunc() {
        view.addSubview(categoriesView)
        
        categoriesView.frame = CGRect(x: 0, y: 130, width: UIScreen.main.bounds.width, height: 220)
        categoriesView.backgroundColor = .white
        
        
        categoriesView.addSubview(categoriesLabel)
        categoriesLabel.frame = CGRect(x: 15, y: 18, width: 100, height: 20)
        categoriesLabel.text = "Категории"
        categoriesLabel.font = .boldSystemFont(ofSize: 17)
        
        categoriesView.addSubview(showAllButton)
        showAllButton.frame = CGRect(x: 315, y: 23, width: 100, height: 15)
        showAllButton.setTitle("Смотреть все", for: .normal)
        showAllButton.tintColor = .systemGray
        showAllButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        showAllButton.addTarget(self, action: #selector(showAllButtonObjc), for: .touchUpInside)
    }
    func recommendedLabelFunc() {
        view.addSubview(recommendedLabel)
        
        recommendedLabel.frame = CGRect(x: 15, y: 380, width: 190, height: 21)
        recommendedLabel.text = "Рекомендованое вам"
        recommendedLabel.font = UIFont.boldSystemFont(ofSize: 18)
    }
   
}
class PaddedSearchBarField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 10)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
