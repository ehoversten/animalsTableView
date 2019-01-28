//
//  ViewController.swift
//  newBeast
//
//  Created by Erik Hoversten on 1/27/19.
//  Copyright © 2019 Erik Hoversten. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create this array at the top of your class as a property
    var tasks = ["Exercise", "Wireframe for some project", "Do laundry", "iOS programming practice", "Python Programming practice", "Work on Ecommerce project"]


    @IBOutlet weak var beastTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func newBeastButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // declare number of cells
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // declare TableView cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "protoCell", for: indexPath)
        // add text to each cell
        cell.textLabel?.text = tasks[indexPath.row]
        // return cell to tableView
        return cell
    }
}

