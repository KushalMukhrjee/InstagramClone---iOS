//
//  SignUpViewController.swift
//  InstagramClone
//
//  Created by Kushal on 04/02/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class SignUpViewController: UIViewController {
    
    var signUpView: SignUpView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        signUpView = SignUpView()
        
        self.view.addSubview(signUpView)
        
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        
        signUpView.pinToEdges(of: self.view, toSafeArea: true)
        
        signUpView.loginWithFacebookButton.addTarget(self, action: #selector(facebookLogin(sender:)), for: .touchUpInside)
        
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
    
    @objc func facebookLogin(sender: UIButton) {
        
        let fbLoginManager = LoginManager()
        
        fbLoginManager.logIn(permissions: [], from: self) { (loginResult, err) in
            if err != nil {
                print(err?.localizedDescription as Any)
            } else {
                guard let loginResult = loginResult else {return}
                
                if !loginResult.isCancelled {
                    loginWithFacebook(withAccessToken: AccessToken.current!.tokenString) { (authDataResult, err) -> (Void) in
                        if err != nil {
                            
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
}
