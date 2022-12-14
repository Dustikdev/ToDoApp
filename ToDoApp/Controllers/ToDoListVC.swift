//
//  ToDoListVC.swift
//  ToDoApp
//
//  Created by Никита Швец on 14.12.2022.
//

import UIKit

class ToDoListVC: UIViewController {
    
    let toDoListTableView = UITableView()
    let exampleArr = ["qweqwd","sdfsdfs","hghfghj","jkliou"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        toDoListTableView.dataSource = self
        toDoListTableView.delegate = self
        toDoListTableView.register(ToDoCell.self, forCellReuseIdentifier: Constants.CellIndentificators.toDoCellIdentificator)
    }
}

extension ToDoListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exampleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIndentificators.toDoCellIdentificator) as! ToDoCell
        cell.cellLabel.text = exampleArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ToDoCell
        if cell.cellisSelected {
            cell.cellUIView.backgroundColor = .systemGray3
            cell.checkMark.isHidden = true
            cell.cellisSelected = false
        } else {
            cell.cellUIView.backgroundColor = .red
            cell.checkMark.isHidden = false
            cell.cellisSelected = true
        }
    }
}
