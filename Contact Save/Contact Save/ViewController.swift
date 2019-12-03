//
//  ViewController.swift
//  Contact Save
//
//  Created by Armaja LaRue-Hill on 11/8/19.
//  Copyright © 2019 Armaja LaRue-Hill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    
    var people = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onPlusTapped(){
        let alert = UIAlertController(title: "Add Contact", message:nil, preferredStyle:  .alert)
       alert.addTextField {textField in textField.placeholder = "Name" }
             
        alert.addTextField {textField in textField.placeholder = "Age"
            textField.placeholder = "Age"
            textField.keyboardType = . numberPad
            
        }
        
        let action 
        
    extension ViewController: UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return people.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
                cell.textLabel?.text = ""
                cell.detailTextLabel?.text = ""
                return cell
        }
        
    
    
}

