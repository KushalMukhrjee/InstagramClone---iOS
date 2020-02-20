//
//  SignUpViewController.swift
//  InstagramClone
//
//  Created by Kushal on 04/02/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var signUpView: SignUpView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        signUpView = SignUpView()
        
        self.view.addSubview(signUpView)
        
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        
        signUpView.pinToEdges(of: self.view, toSafeArea: true)
        
        signUpView.logInButton.addTarget(self, action: #selector(logInButtonClicked(sender:)), for: .touchUpInside)
        signUpView.signupWithEmailOrPhoneNumberButton.addTarget(self, action: #selector(signUpWithPhoneOrEmailButtonClicked(sender:)), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        signUpView.updateConstraints()
    }
    
    @objc func logInButtonClicked(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func signUpWithPhoneOrEmailButtonClicked(sender: UIButton) {
        
        let signUpOptionsVC = SignUpOptionsViewController()
        present(signUpOptionsVC, animated: true, completion: nil)
        
    }
}
