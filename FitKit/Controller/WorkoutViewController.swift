//
//  WorkoutViewController.swift
//  FitKit
//
//  Created by Korman Chen on 2/26/18.
//  Copyright © 2018 Korman Chen. All rights reserved.
//

import UIKit

class WorkoutViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(WorkoutTableViewCell.self, forCellReuseIdentifier: "workoutCell")
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        view.backgroundColor = UIColor.white
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workoutCell") as! WorkoutTableViewCell
        cell.name.text = "Chest"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return 3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? WorkoutTableViewCell {
            print(cell.name.text)
        }
    }
}


