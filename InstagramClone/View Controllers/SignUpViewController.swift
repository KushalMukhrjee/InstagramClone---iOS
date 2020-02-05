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

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        
        signUpView.updateConstraints()
    }
    

}
