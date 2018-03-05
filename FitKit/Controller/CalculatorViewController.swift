//
//  CalculatorViewController.swift
//  FitKit
//
//  Created by Korman Chen on 2/26/18.
//  Copyright © 2018 Korman Chen. All rights reserved.
//

import UIKit
import HexColors
import Firebase

class CalculatorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        fatalError("Using too much memory for some reason")
    }
    
    func setup() {
        navigationItem.title = "Calculator"
        view.backgroundColor = UIColor("#50595C")
    }
}
