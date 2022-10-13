//
//  CategoryViewController.swift
//  Todoey
//
//  Created by boockich mac on 13.10.2022.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    var categoryArray = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let category = categoryArray[indexPath.row]
        
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            content.text = category.name
            cell.contentConfiguration = content
        } else {
            cell.textLabel?.text = category.name
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todoListViewController = TodoListViewController()
        show(todoListViewController, sender: self)
        saveCategories()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Data Manipulation Methods
    
    func saveCategories() {
        do {
            try context.save()
        } catch {
            print("Error saving context, \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            categoryArray = try context.fetch(request)
        } catch {
            print("Error fetching context, \(error)")
        }
        tableView.reloadData()
    }
    
    
    //MARK: - Add new Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {

        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        
        var textField = UITextField()
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "create new category"
            
            textField = alertTextField
        }
        
        let action = UIAlertAction(title: "Add category", style: .default) { (action) in
            
            if let text = textField.text {
                let newCategory = Category(context: self.context)
                newCategory.name = text
                self.categoryArray.append(newCategory)
            }
            self.saveCategories()
        }
        
        alert.addAction(action)
        present(alert, animated: true)
        
    }
    
    //MARK: - TableView Delegate Methods
    
}
