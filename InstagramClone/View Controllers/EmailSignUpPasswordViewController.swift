//
//  EmailSignUpPasswordViewController.swift
//  InstagramClone
//
//  Created by Kushal on 19/02/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import UIKit
import Firebase
class EmailSignUpPasswordViewController: UIViewController {
    
    var emailSignUpPasswordView: EmailSignUpPasswordView!
    var emailId: String?
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        emailSignUpPasswordView = EmailSignUpPasswordView()
        self.view.addSubview(emailSignUpPasswordView)
        emailSignUpPasswordView.backgroundColor = .systemBackground
        emailSignUpPasswordView.translatesAutoresizingMaskIntoConstraints = false
        
        emailSignUpPasswordView.pinToEdges(of: self.view, toSafeArea: true)
        
        emailSignUpPasswordView.nextButton.addTarget(self, action: #selector(createUser), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func createUser() {
        
        emailSignUpPasswordView.nextButtonActivityIndicator.startSpinning()
        guard let emailId = emailId else {return}
        Auth.auth().createUser(withEmail: emailId, password: emailSignUpPasswordView.passwordTextField.text!) { (result, err) in
            if err != nil {
                
                if let err = err as NSError? {
                    
                    switch err.code {
                    case AuthErrorCode.weakPassword.rawValue:
                        
                        showModalAlert(on: self, title: "Invalid password", message: "Password must be atleast 6 characters or more.", buttonTitlesWithAction: [:], completion: nil)
                        
                    default:
                        print(err.localizedDescription)
                    }
                    
                    
                    
                }
                
                
            } else {
                self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            }
            
            self.emailSignUpPasswordView.nextButtonActivityIndicator.stopSpinning(buttonTitle: "Next")
            
        }
        
    }

   
}



