//
//  LoginView.swift
//  InstagramClone
//
//  Created by Kushal on 30/01/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import UIKit

//Contains all elements for Login page

class LoginView: UIView {
    
    
    var topContainer: UIView!
    var bottomContainer: UIView!
    
    
    //Top container UI elements
    var instagramLabel: UILabel!
    var userDetailsStackView: UIStackView!
    var userNameTextField: UITextField!
    var passwordTextField: UITextField!
    var logInButton: UIButton!
    var logInActivityIndicator: UIActivityIndicatorView!
    var seperatorStackView: UIStackView!
    var seperatorViewOne: UIView!
    var seperatorViewTwo: UIView!
    var orLabel: UILabel!
    var loginWithFacebookButton: UIButton!
    var facebookLogoImageView: UIImageView!
    var forgotPasswordButton: UIButton!
    
    
    //Bottom container UI elements
    var noAccountLabel: UILabel!
    var signUpButton: UIButton!
    
    
    
    fileprivate func setupTopContainer() {
        topContainer = UIView()
        self.addSubview(topContainer)
        topContainer.translatesAutoresizingMaskIntoConstraints = false
        
        topContainer.layer.borderWidth = 1.0
        topContainer.layer.borderColor = UIColor.systemGray.cgColor
        topContainer.backgroundColor = .systemBackground
        
        
        instagramLabel = UILabel()
        topContainer.addSubview(instagramLabel)
        instagramLabel.translatesAutoresizingMaskIntoConstraints = false
        instagramLabel.font = UIFont(name: "Billabong", size: 60)
        instagramLabel.text = "Instagram"
        
        userNameTextField = UITextField()
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.placeholder = "Phone number, username, or email"
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.clearButtonMode = .whileEditing
        userNameTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: [.valueChanged, .allEditingEvents])
        
        
        
        passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: [.valueChanged, .allEditingEvents])
        
        logInButton = UIButton(type: .system)
        logInButton.setTitle("Log in", for: .normal)
        logInButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.backgroundColor = #colorLiteral(red: 0.09019607843, green: 0.4705882353, blue: 0.9490196078, alpha: 1)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.layer.cornerRadius = 5
        logInButton.alpha = 0.3
        logInButton.isEnabled = false
        
        logInActivityIndicator = UIActivityIndicatorView()
        logInActivityIndicator.style = .medium
        logInActivityIndicator.color = .white
        logInButton.addSubview(logInActivityIndicator)
        logInActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        seperatorViewOne = UIView()
        seperatorViewOne.translatesAutoresizingMaskIntoConstraints = false
        seperatorViewOne.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        seperatorViewTwo = UIView()
        seperatorViewTwo.translatesAutoresizingMaskIntoConstraints = false
        seperatorViewTwo.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        orLabel = UILabel()
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        orLabel.text = "OR"
        orLabel.font = UIFont.boldSystemFont(ofSize: 18)
        orLabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        orLabel.textAlignment = .center
        orLabel.textAlignment = .center
        
        seperatorStackView = UIStackView()
        seperatorStackView.translatesAutoresizingMaskIntoConstraints = false
        seperatorStackView.alignment = .firstBaseline
        seperatorStackView.axis = .horizontal
        seperatorStackView.spacing = 0
        seperatorStackView.distribution = .fillEqually
        seperatorStackView.addArrangedSubview(seperatorViewOne)
        seperatorStackView.addArrangedSubview(orLabel)
        seperatorStackView.addArrangedSubview(seperatorViewTwo)
        
        userDetailsStackView = UIStackView()
        userDetailsStackView.translatesAutoresizingMaskIntoConstraints = false
        userDetailsStackView.alignment = .center
        userDetailsStackView.axis = .vertical
        userDetailsStackView.distribution = .fillEqually
        userDetailsStackView.spacing = 15
        
        userDetailsStackView.addArrangedSubview(userNameTextField)
        userDetailsStackView.addArrangedSubview(passwordTextField)
        userDetailsStackView.addArrangedSubview(logInButton)
        userDetailsStackView.addArrangedSubview(seperatorStackView)
        topContainer.addSubview(userDetailsStackView)
        
        
        loginWithFacebookButton = UIButton()
        
        loginWithFacebookButton = UIButton(type: .system)
        topContainer.addSubview(loginWithFacebookButton)
        loginWithFacebookButton.translatesAutoresizingMaskIntoConstraints = false
        loginWithFacebookButton.setTitle("Log in with Facebook", for: .normal)
        loginWithFacebookButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        loginWithFacebookButton.setTitleColor(#colorLiteral(red: 0.09019607843, green: 0.4705882353, blue: 0.9490196078, alpha: 1), for: .normal)
        
        facebookLogoImageView = UIImageView()
        topContainer.addSubview(facebookLogoImageView)
        facebookLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        facebookLogoImageView.image = UIImage(named: "facebookLogo")
        
        forgotPasswordButton = UIButton(type: .system)
        topContainer.addSubview(forgotPasswordButton)
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        forgotPasswordButton.titleLabel?.font = .systemFont(ofSize: 18)
        forgotPasswordButton.setTitleColor(#colorLiteral(red: 0.09019607843, green: 0.4705882353, blue: 0.9490196078, alpha: 1), for: .normal)
        
        
        
    }
    
    fileprivate func setupBottomContainer() {
        bottomContainer = UIView()
        self.addSubview(bottomContainer)
        bottomContainer.translatesAutoresizingMaskIntoConstraints = false
            
        bottomContainer.layer.borderWidth = 1.0
        bottomContainer.layer.borderColor = UIColor.systemGray.cgColor
        bottomContainer.backgroundColor = .systemBackground
        
    
        noAccountLabel = UILabel()
        bottomContainer.addSubview(noAccountLabel)
        noAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        noAccountLabel.text = "Don't have an account?"
        noAccountLabel.font = .systemFont(ofSize: 20)
        
        signUpButton = UIButton(type: .system)
        bottomContainer.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.titleLabel?.font = .systemFont(ofSize: 20)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTopContainer()
        setupBottomContainer()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    fileprivate func layoutConstraintsTopContainerElements() {
        NSLayoutConstraint.activate([
            
            topContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            topContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            topContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            topContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8)
            
        ])
        
        
        NSLayoutConstraint.activate([
            
            instagramLabel.centerXAnchor.constraint(equalToSystemSpacingAfter: topContainer.centerXAnchor, multiplier: 0),
            instagramLabel.topAnchor.constraint(equalToSystemSpacingBelow: topContainer.topAnchor, multiplier: 8)
            
        ])
        
        
        NSLayoutConstraint.activate([
            
            userDetailsStackView.centerXAnchor.constraint(equalToSystemSpacingAfter: topContainer.centerXAnchor, multiplier: 0),
            userDetailsStackView.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor),
            userDetailsStackView.leadingAnchor.constraint(equalTo: topContainer.leadingAnchor),
            userDetailsStackView.trailingAnchor.constraint(equalTo: topContainer.trailingAnchor),
            userDetailsStackView.heightAnchor.constraint(equalToConstant: 220),
            
            
            userNameTextField.widthAnchor.constraint(equalTo: userDetailsStackView.widthAnchor, multiplier: 0.8),
            passwordTextField.widthAnchor.constraint(equalTo: userDetailsStackView.widthAnchor, multiplier: 0.8),
            logInButton.widthAnchor.constraint(equalTo: userDetailsStackView.widthAnchor, multiplier: 0.8),
            
            logInActivityIndicator.centerXAnchor.constraint(equalTo: logInButton.centerXAnchor),
            logInActivityIndicator.centerYAnchor.constraint(equalTo: logInButton.centerYAnchor),
            
            
            seperatorStackView.widthAnchor.constraint(equalTo: userDetailsStackView.widthAnchor, multiplier: 0.8),
            seperatorViewOne.heightAnchor.constraint(equalToConstant: 2),
            seperatorViewOne.widthAnchor.constraint(equalTo: seperatorStackView.widthAnchor, multiplier: 0.4),
            
            seperatorViewTwo.heightAnchor.constraint(equalToConstant: 2),
            seperatorViewTwo.widthAnchor.constraint(equalTo: seperatorStackView.widthAnchor, multiplier: 0.4),
            
            orLabel.widthAnchor.constraint(equalTo: seperatorStackView.widthAnchor, multiplier: 0.2)
        ])
        
        
        NSLayoutConstraint.activate([
            
            loginWithFacebookButton.heightAnchor.constraint(equalToConstant: 30),
            loginWithFacebookButton.centerXAnchor.constraint(equalTo: topContainer.centerXAnchor,constant: 20),
            loginWithFacebookButton.topAnchor.constraint(equalToSystemSpacingBelow:seperatorStackView.bottomAnchor, multiplier: 5),
            
            facebookLogoImageView.trailingAnchor.constraint(equalTo: loginWithFacebookButton.leadingAnchor, constant: -5),
            facebookLogoImageView.heightAnchor.constraint(equalToConstant: 20),
            facebookLogoImageView.centerYAnchor.constraint(equalTo: loginWithFacebookButton.centerYAnchor),
            facebookLogoImageView.widthAnchor.constraint(equalToConstant: 20),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: loginWithFacebookButton.bottomAnchor, constant: 10),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: topContainer.centerXAnchor)
            
        ])
        
        
    }
    
    fileprivate func layoutConstraintsBottomContainerElements() {
        
        NSLayoutConstraint.activate([
            bottomContainer.topAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 15),
            bottomContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            bottomContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            bottomContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            noAccountLabel.centerYAnchor.constraint(equalToSystemSpacingBelow: bottomContainer.centerYAnchor, multiplier: 0),
            signUpButton.leadingAnchor.constraint(equalTo: noAccountLabel.trailingAnchor, constant: 5),
            noAccountLabel.centerXAnchor.constraint(equalTo: bottomContainer.centerXAnchor, constant: -40),
            signUpButton.centerYAnchor.constraint(equalToSystemSpacingBelow: bottomContainer.centerYAnchor, multiplier: 0)
        ])
    }
    
    override func updateConstraints() {
        
        super.updateConstraints()
        layoutConstraintsTopContainerElements()
        layoutConstraintsBottomContainerElements()
                
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        
        if userNameTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            logInButton.alpha = 0.3
            logInButton.isEnabled = false
            
        } else {
            
            logInButton.alpha = 1
            logInButton.isEnabled = true
            
        }
        
        
    }
    
    

}
