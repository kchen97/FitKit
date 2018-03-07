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
    
    private var goalButtons = [UIButton]()
    
    let container: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.distribution = .fillEqually
        stackview.axis = .vertical
        
        return stackview
    }()
    
    lazy var selectGoalButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select Goal", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(handleSelect), for: .touchUpInside)
        
        return button
    }()
    
    lazy var loseWeightButton: UIButton = {
        let button = UIButton()
        button.setTitle("Lose Weight", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.blue
        button.isHidden = true
        
        return button
    }()
    
    lazy var maintainButton: UIButton = {
        let button = UIButton()
        button.setTitle("Maintain", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.red
        button.isHidden = true
        
        return button
    }()
    
    lazy var gainWeightButton: UIButton = {
        let button = UIButton()
        button.setTitle("Gain Weight", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.red
        button.isHidden = true
        
        return button
    }()
    
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
        
        goalButtons.append(selectGoalButton)
        goalButtons.append(loseWeightButton)
        goalButtons.append(maintainButton)
        goalButtons.append(gainWeightButton)
        
        view.addSubview(container)
        
        goalButtons.forEach { (button) in
            container.addArrangedSubview(button)
            button.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
            button.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
            button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        }
        
        container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        container.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    @objc func handleSelect() {
        goalButtons.forEach { (button) in
            if button != selectGoalButton {
                UIView.animate(withDuration: 0.44, animations: {
                    button.isHidden = !button.isHidden
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    
}
