//
//  ToDoListVC.swift
//  ToDoApp
//
//  Created by Никита Швец on 14.12.2022.
//

import UIKit
import RealmSwift

class ToDoListVC: UIViewController {
    
    let realm = try! Realm()
    let toDoListTableView = UITableView()
    var toDoItems: Results<Item>?
    let searchBar = UISearchBar()
    var selectedCategory: Category? {
        didSet {
            loadItems()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        toDoListTableView.dataSource = self
        toDoListTableView.delegate = self
        searchBar.delegate = self
        toDoListTableView.register(ToDoCell.self, forCellReuseIdentifier: Constants.CellIndentificators.toDoCellIdentificator)
        loadItems()
    }
    
    @objc func addButtonDidTapped() {
        let alert = UIAlertController(title: "Add new ToDo action", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            if let textField = alert.textFields?.first {
                if let text = textField.text {
                    if let currendItem = self.selectedCategory {
                        do {
                            try self.realm.write({
                                let newItem = Item()
                                newItem.cellLabelText = text
                                newItem.createdDate = Date()
                                currendItem.items.append(newItem)
                            })
                        } catch {
                            print(error)
                        }
                    }
                    self.toDoListTableView.reloadData()
                }
            }
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "White something..."
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alert.addAction(action)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    func loadItems() {
        toDoItems = selectedCategory?.items.sorted(byKeyPath: "cellLabelText")
        toDoListTableView.reloadData()
    }
}

extension ToDoListVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDoItems?.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIndentificators.toDoCellIdentificator) as! ToDoCell
        if let item = toDoItems?[indexPath.row] {
            cell.configureForCellForRowAt(cell: item)
        } else {
            cell.cellLabel.text = "No items"
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = toDoItems?[indexPath.row] {
            do {
                try realm.write({
                    item.checkMarkisHidden = !item.checkMarkisHidden
                })
            } catch {
                print("select error is \(error)")
            }
        }
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70
    }
}

extension ToDoListVC: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        loadFilteredData()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" {
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }

        } else {
            loadFilteredData()
        }
    }

    func loadFilteredData() {
        toDoItems = toDoItems?.filter("cellLabelText CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "createdDate")
        toDoListTableView.reloadData()
    }

}
