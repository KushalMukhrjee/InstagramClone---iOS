//
//  SignUpView.swift
//  InstagramClone
//
//  Created by Kushal on 04/02/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import UIKit

//The first sign up view

class SignUpView: UIView {
    
    var topContainer: UIView!
    var bottomContainer: UIView!
    
    
    //top container elements
    var instagramLabel: UILabel!
    var loginWithFacebookButton: UIButton!
    var signupWithEmailOrPhoneNumberButton: UIButton!
    
    //bottom container elements
    var alreadyHaveAccountLabel: UILabel!
    var logInButton: UIButton!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        
        setupTopContainer()
        setupBottomContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        super.updateConstraints()
        
        
        NSLayoutConstraint.activate([
           
           topContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
           topContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
           topContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
           topContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8)
           
       ])
        
        NSLayoutConstraint.activate([
        
            instagramLabel.centerXAnchor.constraint(equalTo: topContainer.centerXAnchor),
            instagramLabel.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor),
            
            loginWithFacebookButton.centerXAnchor.constraint(equalTo: topContainer.centerXAnchor),
            loginWithFacebookButton.topAnchor.constraint(equalToSystemSpacingBelow: instagramLabel.topAnchor, multiplier: 16),
            loginWithFacebookButton.leadingAnchor.constraint(equalTo: topContainer.leadingAnchor, constant: 8),
            loginWithFacebookButton.trailingAnchor.constraint(equalTo: topContainer.trailingAnchor, constant: -8),
            loginWithFacebookButton.heightAnchor.constraint(equalToConstant: 40),
            
            signupWithEmailOrPhoneNumberButton.centerXAnchor.constraint(equalTo: topContainer.centerXAnchor),
            signupWithEmailOrPhoneNumberButton.topAnchor.constraint(equalTo: loginWithFacebookButton.bottomAnchor, constant: 24)
        
        ])
        
        
        NSLayoutConstraint.activate([
            bottomContainer.topAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 15),
            bottomContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            bottomContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            bottomContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
        
            alreadyHaveAccountLabel.centerYAnchor.constraint(equalTo: bottomContainer.centerYAnchor),
            alreadyHaveAccountLabel.centerXAnchor.constraint(equalTo: bottomContainer.centerXAnchor, constant: -35),
            logInButton.centerYAnchor.constraint(equalTo: bottomContainer.centerYAnchor),
            logInButton.leadingAnchor.constraint(equalTo: alreadyHaveAccountLabel.trailingAnchor, constant: 5)
        
        ])
        
        
        
        
        
        
    }
    
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
        instagramLabel.font = UIFont(name: Constants.instagramFontName, size: 60)
        instagramLabel.text = "Instagram"
        
        loginWithFacebookButton = UIButton(type: .system)
        topContainer.addSubview(loginWithFacebookButton)
        loginWithFacebookButton.translatesAutoresizingMaskIntoConstraints = false
        loginWithFacebookButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        loginWithFacebookButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        loginWithFacebookButton.backgroundColor = #colorLiteral(red: 0.09019607843, green: 0.4705882353, blue: 0.9490196078, alpha: 1)
        loginWithFacebookButton.layer.cornerRadius = 5
        loginWithFacebookButton.setTitle("Login with Facebook", for: .normal)
        
        signupWithEmailOrPhoneNumberButton = UIButton(type: .system)
        topContainer.addSubview(signupWithEmailOrPhoneNumberButton)
        signupWithEmailOrPhoneNumberButton.translatesAutoresizingMaskIntoConstraints = false
        signupWithEmailOrPhoneNumberButton.setTitle("Sign up with email or phone number", for: .normal)
        signupWithEmailOrPhoneNumberButton.setTitleColor(#colorLiteral(red: 0.09019607843, green: 0.4705882353, blue: 0.9490196078, alpha: 1), for: .normal)
        signupWithEmailOrPhoneNumberButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        
        
    }
    
    fileprivate func setupBottomContainer() {
        
        bottomContainer = UIView()
        self.addSubview(bottomContainer)
        bottomContainer.translatesAutoresizingMaskIntoConstraints = false
            
        bottomContainer.layer.borderWidth = 1.0
        bottomContainer.layer.borderColor = UIColor.systemGray.cgColor
        bottomContainer.backgroundColor = .systemBackground
        
        alreadyHaveAccountLabel = UILabel()
        bottomContainer.addSubview(alreadyHaveAccountLabel)
        alreadyHaveAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        alreadyHaveAccountLabel.text = "Already have an account?"
        alreadyHaveAccountLabel.font = .systemFont(ofSize: 20)
        
        logInButton = UIButton(type: .system)
        bottomContainer.addSubview(logInButton)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.setTitle("Log in", for: .normal)
        logInButton.titleLabel?.font = .systemFont(ofSize: 20)
        
    }
    
    

}
