//
//  LoginViewController.swift
//  FitKit
//
//  Created by Korman Chen on 2/22/18.
//  Copyright © 2018 Korman Chen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: Properties
    let logoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        
        return image
    }()
    
    let inputContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    let emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.masksToBounds = true
        textfield.placeholder = "Email"
        
        return textfield
    }()
    
    let passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.masksToBounds = true
        textfield.isSecureTextEntry = true
        textfield.placeholder = "Password"
        
        return textfield
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Setup view constraints
    func setupViewConstraints() {
        view.backgroundColor = UIColor.darkGray
        view.addSubview(logoImage)
        view.addSubview(inputContainer)
        
        logoImage.widthAnchor.constraint(equalToConstant: 150)
        logoImage.heightAnchor.constraint(equalToConstant: 150)
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

