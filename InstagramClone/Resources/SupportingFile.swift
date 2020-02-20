//
//  SupportingFile.swift
//  InstagramClone
//
//  Created by Kushal on 20/02/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import Foundation
import UIKit
import Firebase

func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}


func doesEmailIdAlreadyExist(emailId: String, completion: @escaping (Bool, Error?) -> ()) {
    
    Auth.auth().fetchSignInMethods(forEmail: emailId) { (methods, err) in
        
        if err != nil {
            completion(false,err)
        } else {
        
            if methods != nil {
                completion(true, nil)
            } else {
                completion (false, nil)
            }
        }
    }
}
    
    func signInUser(emailId: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> ()) {
        Auth.auth().signIn(withEmail: emailId, password: password) {  authResult, error in
          
            if error != nil {
                
                completion(nil,error)
                
                
            } else {
                completion(authResult,nil)
            }
            
        }
    }





///Please do not include the cancel button, it will automatically be there.
func showModalAlert(on vc: UIViewController, title: String, message: String, buttonTitlesWithAction: [String: ((UIAlertAction) -> ())?], completion: (() -> Void)?) {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    alertController.addAction(cancelButton)
    
    for (buttonTitle, action) in buttonTitlesWithAction {
        let button = UIAlertAction(title: buttonTitle, style: .default, handler: action)
        alertController.addAction(button)
    }
    
    vc.present(alertController, animated: true, completion: completion)
    
}


