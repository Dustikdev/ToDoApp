//
//  CategoriesVC+ExtUI.swift
//  ToDoApp
//
//  Created by Никита Швец on 22.12.2022.
//

import UIKit

extension CategoriesVC {
    
    func configureUI() {
        view.backgroundColor = .white
        configureToDoListTableView()
        configureNavigationBar()
    }
    
    func configureToDoListTableView() {
        view.addSubview(categoryTableView)
        categoryTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryTableView.topAnchor.constraint(equalTo: view.topAnchor),
            categoryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            categoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureNavigationBar() {
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = UIColor(red: 0.7, green: 0.5, blue: 1, alpha: 1)
        navigationController?.navigationBar.standardAppearance = standardAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = standardAppearance
        navigationItem.title = "Categories"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(didAddButtonCategoryTapped))
//        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
