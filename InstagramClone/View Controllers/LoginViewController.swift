//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by Kushal on 30/01/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
import FBSDKCoreKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    var loginView: LoginView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView = LoginView()
        self.view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        loginView.pinToEdges(of: self.view, toSafeArea: true)
        
        loginView.logInButton.addTarget(self, action: #selector(loginButtonPressed(sender:)), for: .touchUpInside)
        
        loginView.signUpButton.addTarget(self, action: #selector(signUpButtonPressed(sender:)), for: .touchUpInside)
        
        loginView.loginWithFacebookButton.addTarget(self, action: #selector(facebookLogin(sender:)), for: .touchUpInside)
      
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        
        loginView.updateConstraints()
    }
    
    @objc func loginButtonPressed(sender: UIButton) {
        
        loginView.logInActivityIndicator.startSpinning()
        signInUser(emailId: loginView.userNameTextField.text!, password: loginView.passwordTextField.text!) { [weak self](authResult, err) in
            if err != nil {
                
                if let err = err as NSError? {
                    switch err.code {
                    case AuthErrorCode.wrongPassword.rawValue:
                        
                        showModalAlert(on: self!, title: "Incorrect password", message: "The password you entered is incorrect. Please try again.", buttonTitlesWithAction: [:], completion: nil)
                        
                        
                        
                    case AuthErrorCode.userNotFound.rawValue, AuthErrorCode.invalidEmail.rawValue:
                        
                        showModalAlert(on: self!, title: "Incorrect Username", message: "The username you entered doesn't appear to belong to an account. Please check your username and try again.", buttonTitlesWithAction: [:], completion: nil)
                        
                    default:
                        print(err.localizedDescription)
                    }
                }
                
            } else {
                
                let vc = ViewController()
                vc.modalPresentationStyle = .fullScreen
                self?.present(vc, animated: true, completion: nil)
            }
            self!.loginView.logInActivityIndicator.stopSpinning(buttonTitle: "Log in")
            
        }
        
        
        
    }
    
    @objc func signUpButtonPressed(sender: UIButton) {
        
        let signUpVc = SignUpViewController()
        signUpVc.modalPresentationStyle = .fullScreen
        
        present(signUpVc, animated: true, completion: nil)
        
    }
    
    @objc func facebookLogin(sender: UIButton) {
        
        let fbLoginManager = LoginManager()
        
        fbLoginManager.logIn(permissions: [], from: self) { (result, err) in
            
            if err != nil {
                print(err?.localizedDescription as Any)
            } else {
                
                guard let result = result else {return}
                
                if !result.isCancelled {
                    loginWithFacebook(withAccessToken: AccessToken.current!.tokenString) { (authDataResult, err) -> (Void) in
                        if err != nil {
                            print(err?.localizedDescription as Any)
                        } else {
                            
                            let vc = ViewController()
                            vc.modalPresentationStyle = .fullScreen
                            self.present(vc, animated: true, completion: nil)
                            
                        }
                    }
                }
            }
        }
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
    
    func pinToCenter(of superView: UIView) {
        
        
        NSLayoutConstraint.activate([
            
            
            self.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: superView.centerYAnchor)
        
        
        ])
        
    }

}



