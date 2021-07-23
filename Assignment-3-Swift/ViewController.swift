//
//  ViewController.swift
//  Assignment-3-Swift
//
//  Created by Taeler Burgess on 2021-07-21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    //Creating outlet for the table view to connect the table view to the view controller
    @IBOutlet weak var myTableView: UITableView!
    
    //Initilizing taskArray as empty String array
    var taskArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Appending values as a test
        taskArray.append("Do Laundry")
        taskArray.append("Charge Phone")
        taskArray.append("Do Homework")
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
        cell.textLabel?.text = taskArray[indexPath.row]
        return cell
    }
    
    //This func is called when the + button is clicked
    @IBAction func onAddClick(_ sender: Any) {
        let alert = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)

        alert.addTextField { (textField) in
            textField.placeholder = "Write an Item"
        }

        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (alertAction) in }
        alert.addAction(cancel)

        self.present(alert, animated: true, completion: nil)
        
    }
    
}

