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
    private var textFields = [UITextField]()
    private var goalSelected = false
    
    let buttonContainer: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.distribution = .fillEqually
        stackview.axis = .vertical
        
        return stackview
    }()
    
    let textFieldContainer: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.distribution = .fillEqually
        stackview.axis = .vertical
        
        return stackview
    }()
    
    let caloriesTextField: UITextField = {
        let tf = UITextField()
        tf.layer.masksToBounds = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Maintenance Calories"
        
        return tf
    }()
    
    let carbTextField: UITextField = {
        let tf = UITextField()
        tf.layer.masksToBounds = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Carbohydrates"
        tf.isHidden = true
        
        return tf
    }()
    
    let proteinTextField: UITextField = {
        let tf = UITextField()
        tf.layer.masksToBounds = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Protein"
        tf.isHidden = true
        
        return tf
    }()
    
    let fatTextField: UITextField = {
        let tf = UITextField()
        tf.layer.masksToBounds = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Fat"
        tf.isHidden = true
        
        return tf
    }()
    
    lazy var selectGoalButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select Goal", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(handleSelect(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var loseWeightButton: UIButton = {
        let button = UIButton()
        button.setTitle("Lose Weight", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.blue
        button.isHidden = true
        button.addTarget(self, action: #selector(handleSelect(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var maintainButton: UIButton = {
        let button = UIButton()
        button.setTitle("Maintain", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.red
        button.isHidden = true
        button.addTarget(self, action: #selector(handleSelect(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var gainWeightButton: UIButton = {
        let button = UIButton()
        button.setTitle("Gain Weight", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.red
        button.isHidden = true
        button.addTarget(self, action: #selector(handleSelect(sender:)), for: .touchUpInside)
        
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
        
        goalButtons = [selectGoalButton, loseWeightButton, maintainButton, gainWeightButton]
        
//        goalButtons.append(selectGoalButton)
//        goalButtons.append(loseWeightButton)
//        goalButtons.append(maintainButton)
//        goalButtons.append(gainWeightButton)
        
        textFields = [caloriesTextField, carbTextField, proteinTextField, fatTextField]
        
//        textFields.append(caloriesTextField)
//        textFields.append(carbTextField)
//        textFields.append(proteinTextField)
//        textFields.append(fatTextField)
        
        view.addSubview(buttonContainer)
        view.addSubview(textFieldContainer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapToDismiss)))
        
        goalButtons.forEach { (button) in
            buttonContainer.addArrangedSubview(button)
            button.leadingAnchor.constraint(equalTo: buttonContainer.leadingAnchor).isActive = true
            button.trailingAnchor.constraint(equalTo: buttonContainer.trailingAnchor).isActive = true
            button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        }
        
        textFields.forEach { (textfield) in
            textFieldContainer.addArrangedSubview(textfield)
            textfield.leadingAnchor.constraint(equalTo: buttonContainer.leadingAnchor).isActive = true
            textfield.trailingAnchor.constraint(equalTo: buttonContainer.trailingAnchor).isActive = true
            textfield.heightAnchor.constraint(equalToConstant: 60).isActive = true
        }
        
        textFieldContainer.topAnchor.constraint(equalTo: buttonContainer.bottomAnchor).isActive = true
        textFieldContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textFieldContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        buttonContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        buttonContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        buttonContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    @objc func handleSelect(sender: UIButton) {
        if sender != selectGoalButton {goalSelected = true}
        animate(goalButtons.filter {$0 != selectGoalButton})
        shouldDisplayTextFields()
        print(goalSelected)
    }
    
    @objc func handleTapToDismiss() {
        view.endEditing(true)
        shouldDisplayTextFields()
    }
    
    func animate(_ uiArray: [Any]) {
        if let buttonArray = uiArray as? [UIButton] {
            buttonArray.forEach({ (button) in
                UIView.animate(withDuration: 0.44, animations: {
                    button.isHidden = !button.isHidden
                    self.view.layoutIfNeeded()
                })
            })
        }
        else if let tfArray = uiArray as? [UITextField] {
            tfArray.forEach({ (tf) in
                UIView.animate(withDuration: 0.44, animations: {
                    tf.isHidden = !tf.isHidden
                    self.view.layoutIfNeeded()
                })
            })
        }
    }
    
    func shouldDisplayTextFields() {
        if goalSelected && !(caloriesTextField.text?.isEmpty)! && proteinTextField.isHidden {
            animate(textFields.filter {$0 != caloriesTextField})
        }
    }
    
}
