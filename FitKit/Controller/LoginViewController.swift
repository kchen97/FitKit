//
//  LoginViewController.swift
//  FitKit
//
//  Created by Korman Chen on 2/22/18.
//  Copyright © 2018 Korman Chen. All rights reserved.
//

import UIKit
import Firebase
import HexColors

class LoginViewController: UIViewController {

    //MARK: Properties
    let logoImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.red
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        
        return image
    }()
    
    let inputContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        
        return view
    }()
    
    let emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.font = UIFont(name: (textfield.font?.fontName)!, size: 14)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.masksToBounds = true
        textfield.placeholder = "Email"
        
        return textfield
    }()
    
    let inputSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 250, g: 250, b: 250)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        
        return view
    }()
    
    let passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.font = UIFont(name: (textfield.font?.fontName)!, size: 14)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.masksToBounds = true
        textfield.isSecureTextEntry = true
        textfield.placeholder = "Password"
        
        return textfield
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor("#302939")
        
        return button
    }()
    
    let signupLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account? Create one"
        label.font = UIFont(name: (label.font?.fontName)!, size: 8)
        label.textColor = UIColor("#FAFAFA")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        fatalError("Using too much memory.")
    }
    
    //MARK: Setup view constraints
    func setupViewConstraints() {
        navigationItem.title = "Login"
        view.backgroundColor = UIColor("#50595C")
        view.addSubview(logoImage)
        view.addSubview(inputContainer)
        view.addSubview(loginButton)
        view.addSubview(signupLabel)
        inputContainer.addSubview(emailTextField)
        inputContainer.addSubview(passwordTextField)
        inputContainer.addSubview(inputSeparator)
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)

        inputContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainer.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        logoImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImage.bottomAnchor.constraint(equalTo: inputContainer.topAnchor, constant: -50).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        emailTextField.leadingAnchor.constraint(equalTo: inputContainer.leadingAnchor, constant: 8).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: inputContainer.trailingAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: inputContainer.topAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputContainer.heightAnchor, multiplier: 0.5).isActive = true
        
        inputSeparator.leadingAnchor.constraint(equalTo: inputContainer.leadingAnchor).isActive = true
        inputSeparator.trailingAnchor.constraint(equalTo: inputContainer.trailingAnchor).isActive = true
        inputSeparator.heightAnchor.constraint(equalToConstant: 2).isActive = true
        inputSeparator.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        
        passwordTextField.leadingAnchor.constraint(equalTo: inputContainer.leadingAnchor, constant: 8).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: inputContainer.trailingAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: inputSeparator.bottomAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputContainer.heightAnchor, multiplier: 0.5).isActive = true
        
        loginButton.leadingAnchor.constraint(equalTo: inputContainer.leadingAnchor).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: inputContainer.trailingAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: inputContainer.bottomAnchor, constant: 75).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        signupLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signupLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10).isActive = true
        signupLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    @objc func handleLogin() {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            DispatchQueue.global(qos: .background).async {
                Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                    if error != nil {
                        DispatchQueue.main.async {
                            print(error!)
                        }
                    }
                    else {
                        DispatchQueue.main.async {
                            let tabVC = UITabBarController()
                            let workoutVC = AllWorkoutViewController()
                            let calcVC = CalculatorViewController()

                            workoutVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
                            workoutVC.tabBarItem.title = "Workouts"
                            
                            calcVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
                            calcVC.tabBarItem.title = "Calculator"

                            tabVC.viewControllers = [workoutVC, calcVC]
                                
                            self.navigationController?.pushViewController(tabVC, animated: true)
                        }
                    }
                })
            }
        }
        
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
