//
//  CountryCodeView.swift
//  InstagramClone
//
//  Created by Kushal on 10/02/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import UIKit

class CountryCodeView: UIView {
    
 
    var viewHeaderLabel: UILabel!
    var countryCodesTableView: UITableView!
    var countryCodes = [CountryCodeModel]()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        viewHeaderLabel = UILabel()
        viewHeaderLabel.font = .boldSystemFont(ofSize: 16)
        viewHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        viewHeaderLabel.text = "SELECT YOUR COUNTRY"
        self.addSubview(viewHeaderLabel)
        
        countryCodesTableView = UITableView()
        countryCodesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "countrycodecell")
        countryCodesTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(countryCodesTableView)
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   override func updateConstraints() {
       super.updateConstraints()
    
      NSLayoutConstraint.activate([
                 
         viewHeaderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
         viewHeaderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
         
         countryCodesTableView.topAnchor.constraint(equalTo: viewHeaderLabel.bottomAnchor, constant: 16),
         countryCodesTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
         countryCodesTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
         countryCodesTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
         
     ])
   }
    
    
}






   
   
   
