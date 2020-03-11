//
//  SplashViewController.swift
//  InstagramClone
//
//  Created by ndVOR on 25/02/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    var splashImgageView: UIImageView!
    var lastUserId: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splashImgageView = UIImageView()
        self.view.addSubview(splashImgageView)
        splashImgageView.translatesAutoresizingMaskIntoConstraints = false
        splashImgageView.image = UIImage(named: Constants.instagramImageName)
        
        NSLayoutConstraint.activate([
        
            splashImgageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            splashImgageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            splashImgageView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2),
            splashImgageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2)
        
        ])
        
        
        
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
            lastUserId = UserDefaults.standard.string(forKey: Constants.lastUserId)
            self.startLoading {
                
                if self.lastUserId != nil {
                    
                    showMainTabBarController(on: self, animated: false, modalPresentationStyle: .fullScreen)
                } else {
                    let logInVC = LoginViewController()
                    presentViewController(logInVC, on: self, animated: true, withNavigationController: false, modalPresentationStyle: .fullScreen)
                }
            }
    }
    
    func startLoading(onFinish: @escaping ()->()) {
        
        
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
            
            UIView.animate(withDuration: 0.2) {
                self.splashImgageView.transform = self.splashImgageView.transform.rotated(by: CGFloat(Double.pi/4))
            }
        }
        
        timer.fire()
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
            timer.invalidate()
            onFinish()
            
        }
        
    }
    

    

    
}
