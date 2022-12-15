//
//  ToDoListVC.swift
//  ToDoApp
//
//  Created by Никита Швец on 14.12.2022.
//

import UIKit

class ToDoListVC: UIViewController {
    
    let defaults = UserDefaults.standard
    let toDoListTableView = UITableView()
    var exampleArr = [String]()
    var toDoArray = [ToDoCellModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoArray = [(ToDoCellModel(cellLabelText: "aaaaa", checkMarkisHidden: true)), (ToDoCellModel(cellLabelText: "bbbbb", checkMarkisHidden: true)), (ToDoCellModel(cellLabelText: "ccccc", checkMarkisHidden: true)), (ToDoCellModel(cellLabelText: "ddddd", checkMarkisHidden: true))]
//        if let items = defaults.array(forKey: "textArray") as? [String] {
//            exampleArr = items
//        }
        configureUI()
        toDoListTableView.dataSource = self
        toDoListTableView.delegate = self
        toDoListTableView.register(ToDoCell.self, forCellReuseIdentifier: Constants.CellIndentificators.toDoCellIdentificator)
    }
    
    @objc func addButtonDidTapped() {
        let alert = UIAlertController(title: "Add new ToDo action", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            if let textField = alert.textFields?.first {
                if let text = textField.text {
                    self.exampleArr.append(text)
                    self.defaults.set(self.exampleArr, forKey: "textArray")
                    print(text)
                    self.toDoListTableView.reloadData()
                }
            }
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "White something..."
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}

extension ToDoListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIndentificators.toDoCellIdentificator) as! ToDoCell
        cell.cellLabel.text = toDoArray[indexPath.row].cellLabelText
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ToDoCell
        tableView.deselectRow(at: indexPath, animated: true)
        if cell.cellisSelected {
            cell.checkMark.isHidden = true
            cell.cellisSelected = false
        } else {
            cell.checkMark.isHidden = false
            cell.cellisSelected = true
        }
    }
}
