//
//  ToDoListVC.swift
//  ToDoApp
//
//  Created by Никита Швец on 14.12.2022.
//

import UIKit
import CoreData

class ToDoListVC: UIViewController {
    
    let toDoListTableView = UITableView()
    var toDoArray = [ToDoCellModel]()
//    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathExtension("Items.plist") old plist implementation
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    let encoder = Coder() old plist implementation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        toDoListTableView.dataSource = self
        toDoListTableView.delegate = self
        toDoListTableView.register(ToDoCell.self, forCellReuseIdentifier: Constants.CellIndentificators.toDoCellIdentificator)
//        toDoArray = encoder.decode(url: dataFilePath) old plist implementation
    }
    
    @objc func addButtonDidTapped() {
        let alert = UIAlertController(title: "Add new ToDo action", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            if let textField = alert.textFields?.first {
                if let text = textField.text {
                    let newItem = ToDoCellModel(context: self.context)
                    newItem.cellLabelText = text
                    newItem.checkMarkisHidden = true
                    self.toDoArray.append(newItem)
                    do {
                        try self.context.save()
                    } catch {
                        print(error)
                    }
                    /*
                    old plist implementation
                    let newItem = ToDoCellModel()
                    newItem.cellLabelText = text
                    self.toDoArray.append(newItem)
                    print(self.toDoArray.count)
                    self.encoder.encode(arr: self.toDoArray, url: self.dataFilePath)
                    */
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
        cell.configureForCellForRowAt(cell: toDoArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        toDoArray[indexPath.row].checkMarkisHidden = !toDoArray[indexPath.row].checkMarkisHidden
//        encoder.encode(arr: toDoArray, url: dataFilePath) old plist implementation
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
     return 70
    }
}
