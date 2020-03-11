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
import FBSDKCoreKit

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

func loginWithFacebook(withAccessToken accessToken: String, completion: @escaping (AuthDataResult?, Error?) -> (Void)) {
    
    let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
    Auth.auth().signIn(with: credential) { (authDataResult, err) in
        completion(authDataResult,err)
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


extension UIActivityIndicatorView {

    func startSpinning() {
        
        guard let superView = self.superview else {return}
        
        if superview is UIButton {
            let button = superView as! UIButton
            button.setTitle("", for: .normal)

        }
        
        self.startAnimating()
        
    }
    
    func stopSpinning(buttonTitle: String) {
        
        guard let superView = self.superview else {return}
               
               if superview is UIButton {
                   
                   let button = superView as! UIButton
                   button.setTitle(buttonTitle, for: .normal)

               }
               
        self.stopAnimating()
        
    }
    
}

 
func presentViewController(_ viewController: UIViewController,on parentVC: UIViewController, animated: Bool, withNavigationController: Bool, modalPresentationStyle: UIModalPresentationStyle = .automatic, completion: (() -> Void)? = nil) {
    
    if withNavigationController {
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = modalPresentationStyle
        parentVC.present(navigationController, animated: animated, completion: completion)
        
        
    } else {
        
        viewController.modalPresentationStyle = modalPresentationStyle
        parentVC.present(viewController, animated: animated, completion: completion)
        
    }
    
    
}

 
func showMainTabBarController(on parentVC: UIViewController, animated: Bool, modalPresentationStyle: UIModalPresentationStyle = .automatic, completion: (() -> Void)? = nil) {
    
    let mainTabBarVC = MainTabBarController()
    mainTabBarVC.modalPresentationStyle = modalPresentationStyle
    parentVC.present(mainTabBarVC, animated: animated, completion: completion)
    
    
    
}

