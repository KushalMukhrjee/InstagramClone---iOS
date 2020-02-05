//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by Kushal on 30/01/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginView: LoginView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView = LoginView()
        self.view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        loginView.pinToEdges(of: self.view, toSafeArea: true)
        
        
        loginView.signUpButton.addTarget(self, action: #selector(signUpButtonPressed(sender:)), for: .touchUpInside)
        

        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        
        loginView.updateConstraints()
    }
    
    
    @objc func signUpButtonPressed(sender: UIButton) {
        
        present(SignUpViewController(), animated: true, completion: nil)
        
    }
    
    

}


extension UIView {

    func pinToEdges(of superView: UIView, toSafeArea: Bool) {
        
        if toSafeArea {
            NSLayoutConstraint.activate([
                self.topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
                self.bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor),
                self.leadingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leadingAnchor),
                self.trailingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.trailingAnchor)
            ])
            
            
            
        } else {
            NSLayoutConstraint.activate([
                self.topAnchor.constraint(equalTo: superView.topAnchor),
                self.bottomAnchor.constraint(equalTo: superView.bottomAnchor),
                self.leadingAnchor.constraint(equalTo: superView.leadingAnchor),
                self.trailingAnchor.constraint(equalTo: superView.trailingAnchor)
            ])
        }
    }

}

extension UITextField {
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
