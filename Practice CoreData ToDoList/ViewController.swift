//
//  ViewController.swift
//  Practice CoreData ToDoList
//
//  Created by Артем Бородин on 05/07/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CoreData ToDoList"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    
    
    
    
    
    
    
    
    
    // MARK: Core Data
    func getAllItems() {
        do {
            let items = try context.fetch(ToDoListItem.fetchRequest())
        }
        catch {
            // error
        }
    }
    
    func createItem(name: String) {
        let newItem = ToDoListItem(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        do {
            try context.save()
        }
        catch {
            
        }
    }
    
    func deleteItem(item: ToDoListItem) {
        context.delete(item)
        do {
            try context.save()
        }
        catch {
            
        }
    }
    
    func updateItem(item: ToDoListItem, newName: String) {
        item.name = newName
        do {
            try context.save()
        }
        catch {
            
        }
    }
}

