//
//  ViewController.swift
//  Todoey
//
//  Created by boockich mac on 10.10.2022.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["hello", "its me", "ive been wondering"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            content.text = itemArray[indexPath.row]
            cell.contentConfiguration = content
        } else {
            cell.textLabel?.text = itemArray[indexPath.row]
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        
        var textField = UITextField()
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "create new item"
            
            textField = alertTextField
            
        }
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            
            if let text = textField.text {
                self.itemArray.append(text)
                print(text)
            }
            self.tableView.reloadData()
//            print("cool")
        }
        
        alert.addAction(action)
        present(alert, animated: true)
        
    }
}
