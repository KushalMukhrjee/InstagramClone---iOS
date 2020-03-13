//
//  CategoriesCollectionViewCell.swift
//  InstagramClone
//
//  Created by Kushal Mukherjee on 12/03/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import UIKit

class SearchCategoriesCollectionViewCell: UICollectionViewCell {
    
    var categoryTitleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        categoryTitleLabel = UILabel()
        categoryTitleLabel.font = .boldSystemFont(ofSize: 16)
        self.addSubview(categoryTitleLabel)
        categoryTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            
            categoryTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            categoryTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            categoryTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            categoryTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
            
        
        ])
        
        
      
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
