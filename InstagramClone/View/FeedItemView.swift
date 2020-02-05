//
//  FeedItemView.swift
//  InstagramClone
//
//  Created by Kushal on 24/01/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import Foundation
import UIKit

class FeedItemViewCell: UICollectionViewCell {
    
    var headerContainer: UIView!
    var footerContainer: UIView!
    var mediaContainer: UIView!
    
    //Elements for top container
    var headerImageView: UIImageView!
    var headerTitleLabel: UILabel!
    var headerSubTitleLabel: UILabel!
    
    //Elements for media container
    var mediaImageView: UIImageView!
    
    //Elements for footer container
    var descriptionLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        
        super.updateConstraints()
           setupHeaderContainer()
           setupMediaContainer()
           setupFooterContainer()
           
    }
    
    
    func setupHeaderContainer() {
        
        headerContainer = UIView()
        
        
        headerTitleLabel = UILabel()
        headerImageView = UIImageView()
        headerSubTitleLabel = UILabel()
        
        
        headerContainer.addSubview(headerTitleLabel)
//        headerContainer.addSubview(headerSubTitleLabel)
        headerContainer.addSubview(headerImageView)
       
        
        self.addSubview(headerContainer)
        
        
        headerContainer.translatesAutoresizingMaskIntoConstraints = false
        headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerSubTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            
            headerContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerContainer.topAnchor.constraint(equalTo: self.topAnchor),
            headerContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1),
            
            
            headerImageView.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor, constant: 10),
            headerImageView.centerYAnchor.constraint(equalTo: headerContainer.centerYAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant: 36),
            headerImageView.widthAnchor.constraint(equalToConstant: 36),
            
            headerTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: headerImageView.topAnchor, multiplier: 0),
            headerTitleLabel.leadingAnchor.constraint(equalTo: headerImageView.trailingAnchor, constant: 10)
            
        ])
        
        headerImageView.layer.cornerRadius = 18
        headerImageView.clipsToBounds = true
        
       
        
        
        
    }
    
    func setupMediaContainer() {
        
        mediaContainer = UIView()
        self.addSubview(mediaContainer)
        mediaContainer.translatesAutoresizingMaskIntoConstraints = false
        
        mediaImageView = UIImageView()
        mediaContainer.addSubview(mediaImageView)
        mediaImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            mediaContainer.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 0),
            mediaContainer.trailingAnchor.constraint(equalToSystemSpacingAfter: self.trailingAnchor, multiplier: 0),
            mediaContainer.topAnchor.constraint(equalToSystemSpacingBelow: headerContainer.bottomAnchor, multiplier: 0),
            mediaContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            
            mediaImageView.topAnchor.constraint(equalTo: mediaContainer.topAnchor),
            mediaImageView.leadingAnchor.constraint(equalTo: mediaContainer.leadingAnchor),
            mediaImageView.bottomAnchor.constraint(equalTo: mediaContainer.bottomAnchor),
            mediaImageView.trailingAnchor.constraint(equalTo: mediaContainer.trailingAnchor)
            
        ])
        
        mediaImageView.contentMode = .scaleToFill
        
    }
    
    
    func setupFooterContainer() {
        
        footerContainer = UIView()
        self.addSubview(footerContainer)
        footerContainer.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel = UILabel()
        footerContainer.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            footerContainer.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 0),
            footerContainer.trailingAnchor.constraint(equalToSystemSpacingAfter: self.trailingAnchor, multiplier: 0),
            footerContainer.topAnchor.constraint(equalToSystemSpacingBelow: mediaContainer.bottomAnchor, multiplier: 0),
            footerContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2),
            
            
            descriptionLabel.leadingAnchor.constraint(equalTo: footerContainer.leadingAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: footerContainer.topAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: footerContainer.trailingAnchor, constant: -10)
        ])
        
        descriptionLabel.numberOfLines = 0
    }
    
    
}



extension UIImageView {
    
    func downloadImage(urlImgString: String) {
        
        guard let imgUrl = URL(string: urlImgString) else {return}
        
        URLSession.shared.dataTask(with: imgUrl) { (data, res, err) in
            
            guard let imgData = data else {return}
            
            DispatchQueue.main.async {
                self.image = UIImage(data: imgData)
            }
            
            
            
        }.resume()
        
        
        
        
        
        
    }
    
    
    
}
