//
//  ViewController.swift
//  Assignment-3-Swift
//
//  Created by Taeler Burgess on 2021-07-21.
//


import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    //Creating outlet for the table view to connect the table view to the view controller
    @IBOutlet weak var myTableView: UITableView!
    
    //Initilizing taskArray as empty String array that will hold the core data entity
    var taskArray = [ItemsForToDoList]()
    
    //This will allow us to access the persistant container in the AppDelegate file,
    //where the core data is, making it easier to use any entities and any use of core data as a whole
    //Made by: Taeler Burgess
    let context = (UIApplication.shared.delegate as!  AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Connecting the Table View to the delegate and the dataSource
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    // This function determines how many sections there are in the TableView
    // Created by Connor Watson
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // This function determines how many rows(cells) are in the table
    // Created by Connor Watson
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    // This function populates the cells of the table view with data
    // Created by Connor Watson
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = taskArray[indexPath.row].taskName
        return cell
    }
    
    //This func is called when the + button is clicked
        @IBAction func onAddClick(_ sender: Any) {
            
            var inputTextField = UITextField()
            
            let alert = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)

            alert.addTextField { (textField) in
                inputTextField = textField
                inputTextField.placeholder = "Write an Item"
            }
            
            //The "OK" button when pressed will preform the following actions
            let ok = UIAlertAction(title: "OK", style: .default) { (alertAction) in
                
                //Any text being inputted from the user will be added to a list of newly added items, which will use the taskName attribute, which is part of the ItemsForToDoList entity (from the use of core data)
                //Made by: Taeler Burgess
                let addedItemsToList = ItemsForToDoList(context: self.context)
                addedItemsToList.taskName = inputTextField.text!
                self.taskArray.append(addedItemsToList)
                self.itemsSaved()
            }
            
            alert.addAction(ok)

            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (alertAction) in }
            alert.addAction(cancel)
                    
            self.present(alert, animated: true, completion: nil)
        }
    
    //Purpose of the function will be to save the data that the user inputs in the textfield.
    //Based off of the saveContext function in AppDelegate file for core data purposes
    //Made by: Taeler Burgess
    func itemsSaved() {

        do {

            try context.save()
        }

        catch {

            print("There was a problem saving the item. Please try again.")
        }
        
        //Will be in charge of helping to reload the table and display the newly added item
        myTableView.reloadData()
    }

    
}




