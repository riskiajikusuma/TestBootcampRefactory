//
//  ViewController.swift
//  ToDoApps
//
//  Created by riski aji kusuma on 18/12/21.
//

import UIKit
import CoreData

class ToDoViewController: UITableViewController {
    
    var list = [Task]()
    let userDefault = UserDefaults.standard
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("List.plist")
    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(dataFilePath)
        
        loadItems()
        
        tableView.register(UINib(nibName: "ToDoList", bundle: nil), forCellReuseIdentifier: "ListCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ToDoList
        cell.taskLabel.text = list[indexPath.row].task
        
        if list[indexPath.row].complete == true {
            cell.completeColor.backgroundColor = UIColor(named: "LightRed")
            cell.completeLabel.textColor = UIColor(named: "Red")
        } else {
            cell.completeColor.backgroundColor = UIColor(named: "LightGrey")
            cell.completeLabel.textColor = UIColor(named: "Grey")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        list[indexPath.row].complete = !list[indexPath.row].complete
       
        saveItems()
    
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let add = UIAlertController(title: "Add new list", message: "", preferredStyle: .alert)
        
        let btn = UIAlertAction(title: "Add", style: .default) { (action) in
            let newList = Task()
            newList.task = textField.text!
//            newList.complete = false
            
            self.list.append(newList)
//            self.userDefault.set(self.list, forKey: "ToDoApps")
            self.saveItems()
        }
        add.addTextField { (addText) in
            addText.placeholder = "Create new list"
            textField = addText
        }
        add.addAction(btn)
        present(add, animated: true, completion: nil)
        
    }
    
    func saveItems() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(list)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding list item, \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                list = try decoder.decode([Task].self , from: data)
            } catch {
                print("Error dicoding list item")
            }
            
        }
    }
}

