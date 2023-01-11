//
//  CategoriesVC.swift
//  ToDoApp
//
//  Created by Никита Швец on 22.12.2022.
//

import UIKit
import RealmSwift

class CategoriesVC: UIViewController {
    
    let realm = try! Realm()
    let categoryTableView = UITableView()
    var categories: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.register(CollectionCell.self, forCellReuseIdentifier: Constants.CellIndentificators.collectionCellIdentificator)
        loadCategories()
    }
    
    @objc func didAddButtonCategoryTapped() {
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add category", style: .default) { action in
            if let textField = alert.textFields?.first {
                if let text = textField.text {
                    let newCategory = Category()
                    newCategory.name = text
                    self.save(category: newCategory)
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
    
    func save(category: Category) {
        do {
            try realm.write({
                realm.add(category)
            })
        } catch {
            print(error)
        }
        categoryTableView.reloadData()
    }
    
    func loadCategories() {
        categories = realm.objects(Category.self)
        categoryTableView.reloadData()
    }
}

extension CategoriesVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIndentificators.collectionCellIdentificator) as! CollectionCell
        cell.cellLabel.text = categories?[indexPath.row].name ?? "No categories"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = ToDoListVC()
        vc.selectedCategory = categories?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        70
    }
    
}
