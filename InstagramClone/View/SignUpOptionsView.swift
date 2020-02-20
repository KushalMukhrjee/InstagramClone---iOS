//
//  SignUpOptionsView.swift
//  InstagramClone
//
//  Created by Kushal on 05/02/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import UIKit

//Second sign up view

class SignUpOptionsView: UIView {
    
    var userImageView: UIImageView!
    var emailOptionSelectorView: UIView!
    var phoneOptionSelectorView: UIView!
    var optionsStack: UIStackView!
    
    var phoneOptionView: PhoneOptionView!
    var emailOptionView: EmailOptionView!
    
    var optionsView: UIView!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        userImageView = UIImageView()
        self.addSubview(userImageView)
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.image = UIImage(named: "userImage")
        
        let emailTapGesture = UITapGestureRecognizer()
        let phoneTapGesture = UITapGestureRecognizer()
        emailTapGesture.addTarget(self, action: #selector(optionsViewTapped(sender:)))
        phoneTapGesture.addTarget(self, action: #selector(optionsViewTapped(sender:)))
        
        
        //stackview setup
        emailOptionSelectorView = UIView()
        let emailOptionLabel = UILabel()
        NSLayoutConstraint.activate([
            emailOptionLabel.heightAnchor.constraint(equalToConstant: 50),
            emailOptionLabel.widthAnchor.constraint(equalToConstant: 75)
        ])
        emailOptionLabel.translatesAutoresizingMaskIntoConstraints = false
        emailOptionLabel.text = "EMAIL"
        emailOptionLabel.textAlignment = .center
        emailOptionSelectorView.addSubview(emailOptionLabel)
        emailOptionLabel.pinToCenter(of: emailOptionSelectorView)
        
        let emailUnderLineView = UIView()
        emailUnderLineView.backgroundColor = .lightGray
        emailUnderLineView.translatesAutoresizingMaskIntoConstraints = false
        emailOptionSelectorView.addSubview(emailUnderLineView)
        NSLayoutConstraint.activate([
            emailUnderLineView.heightAnchor.constraint(equalToConstant: 1.5),
            emailUnderLineView.bottomAnchor.constraint(equalTo: emailOptionSelectorView.bottomAnchor),
            emailUnderLineView.leadingAnchor.constraint(equalTo: emailOptionSelectorView.leadingAnchor),
            emailUnderLineView.trailingAnchor.constraint(equalTo: emailOptionSelectorView.trailingAnchor)
        
        ])
        
        
        phoneOptionSelectorView = UIView()
        let phoneOptionLabel = UILabel()
        NSLayoutConstraint.activate([
            phoneOptionLabel.heightAnchor.constraint(equalToConstant: 50),
            phoneOptionLabel.widthAnchor.constraint(equalToConstant: 75)
        ])
        phoneOptionLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneOptionLabel.text = "PHONE"
        phoneOptionLabel.textAlignment = .center
        phoneOptionSelectorView.addSubview(phoneOptionLabel)
        phoneOptionLabel.pinToCenter(of: phoneOptionSelectorView)
        
       
        let phoneUnderLineView = UIView()
        phoneUnderLineView.backgroundColor = .lightGray
        phoneUnderLineView.translatesAutoresizingMaskIntoConstraints = false
        phoneOptionSelectorView.addSubview(phoneUnderLineView)
        NSLayoutConstraint.activate([
            phoneUnderLineView.heightAnchor.constraint(equalToConstant: 1.5),
            phoneUnderLineView.bottomAnchor.constraint(equalTo: phoneOptionSelectorView.bottomAnchor),
            phoneUnderLineView.leadingAnchor.constraint(equalTo: phoneOptionSelectorView.leadingAnchor),
            phoneUnderLineView.trailingAnchor.constraint(equalTo: phoneOptionSelectorView.trailingAnchor)
        
        ])
        
        phoneOptionSelectorView.addGestureRecognizer(phoneTapGesture)
        emailOptionSelectorView.addGestureRecognizer(emailTapGesture)
        
        optionsStack = UIStackView(arrangedSubviews: [phoneOptionSelectorView,emailOptionSelectorView])
        self.addSubview(optionsStack)
        optionsStack.translatesAutoresizingMaskIntoConstraints = false
        optionsStack.distribution = .fillEqually
        optionsStack.axis = .horizontal
        optionsStack.spacing = 0
        
        //bottom view for showing what view to have if phone or email selected
        phoneOptionView = PhoneOptionView()
        phoneOptionView.translatesAutoresizingMaskIntoConstraints = false
        
        emailOptionView = EmailOptionView()
        emailOptionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        optionsView = UIView()
        self.addSubview(optionsView)
        optionsView.translatesAutoresizingMaskIntoConstraints = false
        
        optionsViewTapped(sender: emailTapGesture)
        
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        super.updateConstraints()
        
        
        NSLayoutConstraint.activate([
        
            userImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            userImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -(self.frame.height/4)),
            
            optionsStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            optionsStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            optionsStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            optionsStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            optionsStack.heightAnchor.constraint(equalToConstant: 40)
        
        
        ])
        
        NSLayoutConstraint.activate([
        
            optionsView.topAnchor.constraint(equalTo: optionsStack.bottomAnchor, constant: 8),
            optionsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            optionsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            optionsView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        
        
        ])
        
    }
    
    @objc func optionsViewTapped(sender: UIGestureRecognizer) {
        
        
        
        guard let selectedView = sender.view else {return}
        
        phoneOptionSelectorView.subviews[1].backgroundColor = selectedView == phoneOptionSelectorView ? UIColor.darkGray : UIColor.lightGray
        emailOptionSelectorView.subviews[1].backgroundColor = selectedView == emailOptionSelectorView ? UIColor.darkGray : UIColor.lightGray
        
        
        for view in optionsView.subviews {
            view.removeFromSuperview()
        }
        
        if selectedView == phoneOptionSelectorView {
            
            optionsView.addSubview(phoneOptionView)
            phoneOptionView.pinToEdges(of: optionsView, toSafeArea: false)
            emailOptionView.emailTextField.resignFirstResponder()
            phoneOptionView.phoneTextField.becomeFirstResponder()
            
        } else {
            
            optionsView.addSubview(emailOptionView)
            emailOptionView.pinToEdges(of: optionsView, toSafeArea: false)
            phoneOptionView.phoneTextField.resignFirstResponder()
            emailOptionView.emailTextField.becomeFirstResponder()
            
            
            
        }
        
    }
        
}


//View for using phone number for sign up

class PhoneOptionView: UIView {
    
    var phoneTextField: UITextField!
    var nextButton: UIButton!
    var countryCodeView: UIView!
    var countryCodeLabel: UILabel!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        phoneTextField = UITextField()
        self.addSubview(phoneTextField)
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.placeholder = "Phone"
        phoneTextField.borderStyle = .roundedRect
        phoneTextField.keyboardType = .phonePad
        
        
        countryCodeView = UIView(frame: CGRect(x: 0,y: 0,width: 86,height: 28))
        let seperator = UIView(frame: CGRect(x: 85, y:0, width: 1, height: 26))
        seperator.backgroundColor = .lightGray
        countryCodeView.addSubview(seperator)
        countryCodeLabel = UILabel(frame: CGRect(x: 12, y: 3, width: 0, height: 0))
        countryCodeLabel.text = "IN +91"
        countryCodeLabel.sizeToFit()
       
        countryCodeView.addSubview(countryCodeLabel)
       
        phoneTextField.leftView = countryCodeView
        phoneTextField.leftViewMode = .always
        
        phoneTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: [.editingChanged, .editingDidBegin])
        
        
        nextButton = UIButton(type: .system)
        self.addSubview(nextButton)
        nextButton.backgroundColor = #colorLiteral(red: 0.09019607843, green: 0.4705882353, blue: 0.9490196078, alpha: 1)
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        nextButton.layer.cornerRadius = 5
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
        
            phoneTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            phoneTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            phoneTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            phoneTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            nextButton.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 16),
            nextButton.leadingAnchor.constraint(equalTo: phoneTextField.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: phoneTextField.trailingAnchor),
            nextButton.heightAnchor.constraint(equalTo: phoneTextField.heightAnchor)
        
        ])
        
        
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
           
           if sender.text == "" {
               nextButton.alpha = 0.3
               nextButton.isEnabled = false
           } else {
               nextButton.alpha = 1
               nextButton.isEnabled = true
           }
           
       }
    
}

//view for using email id for sign up

class EmailOptionView: UIView {
    
    var emailTextField: UITextField!
    var nextButton: UIButton!
    var invalidEmailIdLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        emailTextField = UITextField()
        self.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.borderStyle = .roundedRect
        emailTextField.placeholder = "Email"
        emailTextField.keyboardType = .emailAddress
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: [.editingChanged, .editingDidBegin])
        
        nextButton = UIButton(type: .system)
        self.addSubview(nextButton)
        nextButton.backgroundColor = #colorLiteral(red: 0.09019607843, green: 0.4705882353, blue: 0.9490196078, alpha: 1)
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        nextButton.layer.cornerRadius = 5
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        invalidEmailIdLabel = UILabel()
        invalidEmailIdLabel.text = "Please enter a valid email address"
        invalidEmailIdLabel.font = .systemFont(ofSize: 16)
        invalidEmailIdLabel.textColor = .systemRed
        self.addSubview(invalidEmailIdLabel)
        invalidEmailIdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
               
           emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
           emailTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
           emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
           emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
           
           invalidEmailIdLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 2),
           invalidEmailIdLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
           invalidEmailIdLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
           invalidEmailIdLabel.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
           
           
           
           nextButton.topAnchor.constraint(equalTo: invalidEmailIdLabel.bottomAnchor, constant: 5),
           nextButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
           nextButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
           nextButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor)
       
       ])
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        
        if sender.text == "" {
            nextButton.alpha = 0.3
            nextButton.isEnabled = false
            invalidEmailIdLabel.isHidden = true
            
        } else {
            nextButton.alpha = 1
            nextButton.isEnabled = true
        }
        
    }
    
    
   
    
    
}




