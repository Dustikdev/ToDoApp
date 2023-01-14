//
//  ToDoListUI+Ext.swift
//  ToDoApp
//
//  Created by Никита Швец on 14.12.2022.
//

import UIKit


//MARK: - Configuring ToDoListVC UI

extension ToDoListVC {
      
    func configureUI() {
        view.backgroundColor = .white
        configureSearchBar()
        configureToDoListTableView()
        configureNavigationBar()
        configureSearchBar()
    }
    
    func configureToDoListTableView() {
        view.addSubview(toDoListTableView)
        toDoListTableView.translatesAutoresizingMaskIntoConstraints = false
        toDoListTableView.separatorStyle = .none
        NSLayoutConstraint.activate([
            toDoListTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            toDoListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            toDoListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toDoListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureSearchBar() {
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchTextField.backgroundColor = .white
        setSearchBarColor()
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureNavigationBar() {
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        standardAppearance.configureWithOpaqueBackground()
//        standardAppearance.backgroundColor = UIColor(red: 0.7, green: 0.5, blue: 1, alpha: 1)
        setNavBarColor(appearance: standardAppearance)
        navigationController?.navigationBar.standardAppearance = standardAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = standardAppearance
        navigationItem.title = selectedCategory?.name
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonDidTapped))
    }
    
    func setNavBarColor(appearance: UINavigationBarAppearance) {
        let color = UIColor(hex: toDoItems?.first?.itemColor ?? "C7C7CC")
        appearance.backgroundColor = color
    }
    
    func setSearchBarColor() {
        let color = UIColor(hex: toDoItems?.first?.itemColor ?? "C7C7CC")
        searchBar.barTintColor = color
    }
}
