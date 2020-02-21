//
//  SignUpOptionsViewController.swift
//  InstagramClone
//
//  Created by Kushal on 05/02/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import UIKit

class SignUpOptionsViewController: UIViewController {
    
    var signUpOptionsView: SignUpOptionsView!
    var countryCodeView: CountryCodeView?
    
    var countryCodeVMInstance = CountryCodeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpOptionsView = SignUpOptionsView()
        self.view.addSubview(signUpOptionsView)
        signUpOptionsView.backgroundColor = .systemBackground
        signUpOptionsView.translatesAutoresizingMaskIntoConstraints = false
        
        let countryCodeTap = UITapGestureRecognizer(target: self, action: #selector(SignUpOptionsViewController.countryCodeTapped(sender:)))
        signUpOptionsView.phoneOptionView.countryCodeView.addGestureRecognizer(countryCodeTap)
        signUpOptionsView.phoneOptionView.phoneTextField.delegate = self
        signUpOptionsView.emailOptionView.emailTextField.delegate = self
        
        signUpOptionsView.pinToEdges(of: self.view, toSafeArea: true)
        
        
        signUpOptionsView.phoneOptionView.nextButton.addTarget(self, action: #selector((nextButtonClicked(sender:))), for: .touchUpInside)
        signUpOptionsView.emailOptionView.nextButton.addTarget(self, action: #selector(nextButtonClicked(sender:)), for: .touchUpInside)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        signUpOptionsView.updateConstraints()
    }
    
    @objc func countryCodeTapped(sender: UITapGestureRecognizer) {
        
        showCountryCodeListView()
       
    }
    
    @objc func nextButtonClicked(sender: UIButton) {
        
        
        
        
        if sender.superview is EmailOptionView {
            
            let emailId = signUpOptionsView.emailOptionView.emailTextField.text!
            
            if isValidEmail(emailId) {
                
                signUpOptionsView.emailOptionView.nextButtonActivityIndicator.startSpinning()
                signUpOptionsView.emailOptionView.invalidEmailIdLabel.isHidden = true
                let emailSignUpPasswordVC = EmailSignUpPasswordViewController()
                emailSignUpPasswordVC.emailId = emailId
                
                doesEmailIdAlreadyExist(emailId: emailId) { (isSuccess, err) in
                    if isSuccess {
                            showModalAlert(on: self, title: "Account already exists", message: "It looks like you already have an Instagram account. You can only have one account per email address.", buttonTitlesWithAction: ["Login with existing account" : nil], completion: nil)
                    } else {
                        self.present(emailSignUpPasswordVC, animated: true, completion: nil)
                    }
                    self.signUpOptionsView.emailOptionView.nextButtonActivityIndicator.stopSpinning(buttonTitle: "Next")
                }
                
            } else {
                signUpOptionsView.emailOptionView.invalidEmailIdLabel.isHidden = false
            }
            
            
        }
       
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
        
        guard let countryCodeView = countryCodeView else {return}
        
        if (event?.touches(for: countryCodeView) == nil) {
            dismissCountryCodeListView()
        }
        
    }
    
    private func showCountryCodeListView() {
        
        self.signUpOptionsView.backgroundColor = UIColor.lightGray
        self.signUpOptionsView.phoneOptionView.phoneTextField.resignFirstResponder()
        self.signUpOptionsView.phoneOptionView.phoneTextField.isEnabled = false
        countryCodeView = CountryCodeView(frame: CGRect(x: self.view.center.x - 150, y: self.view.center.y - 150, width: 300, height: 300))
        countryCodeView!.countryCodesTableView.dataSource = self
        countryCodeView!.countryCodesTableView.delegate = self
        countryCodeView!.countryCodesTableView.rowHeight = UITableView.automaticDimension
        countryCodeVMInstance.getCountryCodes()
        
        
        UIView.animate(withDuration: 1) {
            
            guard let countryCodeView = self.countryCodeView else {return}
            
            countryCodeView.backgroundColor = .systemBackground
            self.view.addSubview(countryCodeView)
        }
        
    }
    
    private func dismissCountryCodeListView() {
        
      
           UIView.animate(withDuration: 0.15) {
               guard let countryCodeView = self.countryCodeView else {return}
               countryCodeView.removeFromSuperview()
               self.signUpOptionsView.backgroundColor = UIColor.systemBackground
               self.signUpOptionsView.phoneOptionView.phoneTextField.becomeFirstResponder()
               self.signUpOptionsView.phoneOptionView.phoneTextField.isEnabled = true
           }
              
           
        
    }
    

}


extension SignUpOptionsViewController: UITableViewDataSource, UITableViewDelegate {
    
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return countryCodeVMInstance.countryCodes.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
       let cell = tableView.dequeueReusableCell(withIdentifier: "countrycodecell", for: indexPath)
    cell.textLabel?.text = "\(countryCodeVMInstance.countryCodes[indexPath.row].name) (\(countryCodeVMInstance.countryCodes[indexPath.row].dialCode))"
    cell.textLabel?.numberOfLines = 0
       return cell
   }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        signUpOptionsView.phoneOptionView.countryCodeLabel.text = countryCodeVMInstance.countryCodes[indexPath.row].code + " " + countryCodeVMInstance.countryCodes[indexPath.row].dialCode
       
        dismissCountryCodeListView()
        signUpOptionsView.phoneOptionView.countryCodeLabel.sizeToFit()
    }
    

}


extension SignUpOptionsViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.view.frame.origin.y -= 80
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.view.frame.origin.y += 80
    }
    
    
}



