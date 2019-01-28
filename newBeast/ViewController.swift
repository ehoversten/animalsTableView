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
    
    var beasts: [String] = ["Lion", "Tiger", "Bear"]


    @IBOutlet weak var beastTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func newBeastButton(_ sender: UIButton) {
        addNewBeast()
    }
    
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
        tableView.dataSource = self
        tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //logic
        
        // declare number of cells
        return beasts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //logic
        
        // Fetch item
        let item = beasts[indexPath.row]
        
        // declare TableView cell -> Dequeue Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "protoCell", for: indexPath)
        // add text to each cell -> Configure Cell
        cell.textLabel?.text = item
        // return cell to tableView -> Return Cell
        return cell
    }
}


