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
        
        guard let emailId = emailId else {return}
        Auth.auth().createUser(withEmail: emailId, password: emailSignUpPasswordView.passwordTextField.text!) { (result, err) in
            if err != nil {
                print("FIR ERR:\(err?.localizedDescription)")
            }
            
            print(result?.user.email)
            self.dismiss(animated: true) {
                self.parent?.dismiss(animated: true, completion: nil)
            }
            
        }
        
    }

   
}



