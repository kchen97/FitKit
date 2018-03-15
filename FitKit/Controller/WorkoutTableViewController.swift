//
//  WorkoutTableViewController.swift
//  FitKit
//
//  Created by Korman Chen on 3/14/18.
//  Copyright © 2018 Korman Chen. All rights reserved.
//

import UIKit
import Hero

class WorkoutTableViewController: UITableViewController {

    var currentWorkout = Workout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
    
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "someCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
//        return currentWorkout.exercises.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "someCell", for: indexPath)
        cell.textLabel?.text = "Benchpress"
        cell.detailTextLabel?.text = "test"
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AllWorkoutViewController()
        vc.hero.modalAnimationType = .zoomOut
        hero.replaceViewController(with: vc)
    }
}
