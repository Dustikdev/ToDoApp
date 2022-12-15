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
        configureToDoListTableView()
        configureNavigationBar()
    }
    
    func configureToDoListTableView() {
        view.addSubview(toDoListTableView)
        toDoListTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toDoListTableView.topAnchor.constraint(equalTo: view.topAnchor),
            toDoListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            toDoListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toDoListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureNavigationBar() {
        navigationItem.title = "ToDo"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonDidTapped))
        navigationController?.navigationBar.backgroundColor = UIColor(red: 0.7, green: 0.5, blue: 1, alpha: 1)
    }
}
