//
//  ToDoListVC.swift
//  ToDoApp
//
//  Created by Никита Швец on 14.12.2022.
//

import UIKit
import RealmSwift

class ToDoListVC: UIViewController {
    
    let toDoListTableView = UITableView()
    var toDoArray = [Item]()
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
//        searchBar.delegate = self
        toDoListTableView.register(ToDoCell.self, forCellReuseIdentifier: Constants.CellIndentificators.toDoCellIdentificator)
//        loadItems()
    }
    
    @objc func addButtonDidTapped() {
        let alert = UIAlertController(title: "Add new ToDo action", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            if let textField = alert.textFields?.first {
                if let text = textField.text {
                    let newItem = Item()
                    newItem.cellLabelText = text
                    newItem.checkMarkisHidden = true
                    
                    self.toDoArray.append(newItem)
                    self.saveItems()
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
    
    func saveItems(items: Item) {
        do {
            try realm.write({
                realm.add(items)
            })
        } catch {
            print(error)
        }
        toDoListTableView.reloadData()
    }
    
//    func loadItems(with request: NSFetchRequest<ToDoCellModel> = ToDoCellModel.fetchRequest(), with predicate: NSPredicate? = nil) {
//        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
//        if let additionalPredicate = predicate {
//            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionalPredicate])
//        } else {
//            request.predicate = categoryPredicate
//        }
//
//        do {
//            toDoArray = try context.fetch(request)
//        } catch {
//            print("error \(error)")
//        }
//        toDoListTableView.reloadData()
//    }
}

extension ToDoListVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDoArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIndentificators.toDoCellIdentificator) as! ToDoCell
        cell.configureForCellForRowAt(cell: toDoArray[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        context.delete(toDoArray[indexPath.row])
//        toDoArray.remove(at: indexPath.row)
        toDoArray[indexPath.row].checkMarkisHidden = !toDoArray[indexPath.row].checkMarkisHidden
        saveItems()
        //        encoder.encode(arr: toDoArray, url: dataFilePath) old plist implementation
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70
    }
}

//extension ToDoListVC: UISearchBarDelegate {
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        loadWithRequest()
//        searchBar.resignFirstResponder()
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text == "" {
//            loadItems()
//            DispatchQueue.main.async {
//                searchBar.resignFirstResponder()
//            }
//
//        } else {
//            loadWithRequest()
//        }
//    }
//
//    func loadWithRequest() {
//        let request: NSFetchRequest<ToDoCellModel> = ToDoCellModel.fetchRequest()
//        let predicate = NSPredicate(format: "cellLabelText CONTAINS[cd] %@", searchBar.text!)
//        request.sortDescriptors = [NSSortDescriptor(key: "cellLabelText", ascending: true)]
//        loadItems(with: request, with: predicate)
//    }
//
//}
