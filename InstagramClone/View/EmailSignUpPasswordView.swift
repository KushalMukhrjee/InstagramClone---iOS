//
//  EmailSignUpPasswordView.swift
//  InstagramClone
//
//  Created by Kushal on 19/02/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import UIKit

class EmailSignUpPasswordView: UIView {
    
    var createPasswordLabel: UILabel!
    var passwordTextField: UITextField!
    var confirmPasswordTextField: UITextField!
    var nextButton: UIButton!
    var nextButtonActivityIndicator: UIActivityIndicatorView!
    var passwordMismatchLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createPasswordLabel = UILabel()
        createPasswordLabel.text = "Create a password"
        createPasswordLabel.font = .systemFont(ofSize: 28)
        self.addSubview(createPasswordLabel)
        createPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField = UITextField()
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Enter password"
        self.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: [.editingChanged, .editingDidBegin])
        passwordTextField.becomeFirstResponder()
        
        confirmPasswordTextField = UITextField()
        confirmPasswordTextField.borderStyle = .roundedRect
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.placeholder = "Re-enter password"
        self.addSubview(confirmPasswordTextField)
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextField.clearButtonMode = .whileEditing
        confirmPasswordTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: [.editingChanged, .editingDidBegin])
        
        nextButton = UIButton(type: .system)
        self.addSubview(nextButton)
        nextButton.backgroundColor = #colorLiteral(red: 0.09019607843, green: 0.4705882353, blue: 0.9490196078, alpha: 1)
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        nextButton.layer.cornerRadius = 5
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        nextButtonActivityIndicator = UIActivityIndicatorView()
        nextButtonActivityIndicator.style = .medium
        nextButtonActivityIndicator.color = .white
        nextButton.addSubview(nextButtonActivityIndicator)
        nextButtonActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        passwordMismatchLabel = UILabel()
        passwordMismatchLabel.text = "Passwords do not match"
        passwordMismatchLabel.font = .systemFont(ofSize: 16)
        passwordMismatchLabel.textColor = .systemRed
        self.addSubview(passwordMismatchLabel)
        passwordMismatchLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            
            createPasswordLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            createPasswordLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 48),
            createPasswordLabel.heightAnchor.constraint(equalToConstant: 30),
            
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            passwordTextField.topAnchor.constraint(equalTo: self.createPasswordLabel.bottomAnchor, constant: 48),
            
            confirmPasswordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            confirmPasswordTextField.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 16),
            
            passwordMismatchLabel.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 8),
            passwordMismatchLabel.leadingAnchor.constraint(equalTo: confirmPasswordTextField.leadingAnchor),
            passwordMismatchLabel.trailingAnchor.constraint(equalTo: confirmPasswordTextField.trailingAnchor),
            passwordMismatchLabel.heightAnchor.constraint(equalTo: confirmPasswordTextField.heightAnchor),
            
            
            nextButton.topAnchor.constraint(equalTo: passwordMismatchLabel.bottomAnchor, constant: 8),
            nextButton.leadingAnchor.constraint(equalTo: confirmPasswordTextField.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: confirmPasswordTextField.trailingAnchor),
            nextButton.heightAnchor.constraint(equalTo: confirmPasswordTextField.heightAnchor),
            
            nextButtonActivityIndicator.centerXAnchor.constraint(equalTo: nextButton.centerXAnchor),
            nextButtonActivityIndicator.centerYAnchor.constraint(equalTo: nextButton.centerYAnchor)
        
        
        ])

        
        
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        
        if passwordTextField.text!.isEmpty && confirmPasswordTextField.text!.isEmpty {
            
            passwordMismatchLabel.isHidden = true
            nextButton.alpha = 0.3
            nextButton.isEnabled = false
            
        } else if passwordTextField.text != confirmPasswordTextField.text {
            passwordMismatchLabel.isHidden = false
            nextButton.alpha = 0.3
            nextButton.isEnabled = false
        } else {
            
            passwordMismatchLabel.isHidden = true
            nextButton.alpha = 1
            nextButton.isEnabled = true
        }
        
    }


}
