//
//  ViewController.swift
//  newBeast
//
//  Created by Erik Hoversten on 1/27/19.
//  Copyright © 2019 Erik Hoversten. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Create this array at the top of your class as a property
    var tasks = ["Exercise", "Wireframe for some project", "Do laundry", "iOS programming practice", "Python Programming practice", "Work on Ecommerce project"]
    // Create an Array in our ViewController to hold (our) DATA
    var beasts: [String] = ["Lion", "Tiger", "Bear"]

    
    @IBOutlet weak var beastTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func newBeastButton(_ sender: UIButton) {
        // Call function to add a new animal to the TableView List when the button is pressed
        addNewBeast()
    }
    
    // Function to add a new animal
    func addNewBeast() {
        // Add user entered (into UITextField) to beasts array
        beasts.append(beastTextField.text!)
        
        let indexPath = IndexPath(row: beasts.count - 1, section: 0)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        
        // Clear textField
        beastTextField.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Tell the TableView that its DATASOURCE is the ViewController
        tableView.dataSource = self
        // Tell the TableView that its DELEGATE is the ViewController
        tableView.delegate = self
        // Reload the DATA in the TableView
        tableView.reloadData()
  
    }

}

// Extend the ViewController and Link the TableView PROTOCOLS to the ViewController
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // declare number of cells
        return beasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch item (DATA -> from the ViewController
        let item = beasts[indexPath.row]
        // declare TableView cell -> Dequeue Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "protoCell", for: indexPath)
        // add text to each cell -> Configure Cell
        cell.textLabel?.text = item
        // return cell to tableView -> Return Cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        // Remove selected row (animal -> Data) from array
        beasts.remove(at: indexPath.row)
        // Reload the DATA in the TableView
        tableView.reloadData()
    }

}


