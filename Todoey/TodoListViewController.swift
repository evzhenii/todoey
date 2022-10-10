//
//  ViewController.swift
//  Todoey
//
//  Created by boockich mac on 10.10.2022.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["hello", "its me", "ive been wondering"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
       return cell
    }
    
    
    
}

