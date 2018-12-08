//
//  ViewController.swift
//  Todoy
//
//  Created by Mustafa Alsoffi on 07/12/2018.
//  Copyright © 2018 Mustafa Alsoffi. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
   
    
    var itemArray = ["Go buy milk", "Buy a new Iphone", "Help your father"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    }
    
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray [indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
      
     
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField ()
        
        let alert = UIAlertController (title: "Add new todoy item!", message: "", preferredStyle: .alert)
        let action = UIAlertAction (title: "Add item", style: .default) { (action) in
        // What will happen once the user clicks the add item button
            self.itemArray.append(textField.text!)
                 self.tableView.reloadData()
            }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat new item here"
            textField = alertTextField
           
            
        }
    
          alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
  
    }
    


