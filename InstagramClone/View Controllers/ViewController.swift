//
//  ViewController.swift
//  InstagramClone
//
//  Created by Kushal on 24/01/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var feedItemsCollectionView: UICollectionView!
    
    var feedItems = Array(repeating: FeedItemModel(), count: 10)

    override func viewDidLoad() {
        super.viewDidLoad()
        //Firebase tryout
        
        
        let dbRef = Database.database().reference()
        
        dbRef.child("myFirstpath").setValue("KushalMukherjee")
        dbRef.child("myFirstpath/KushalMukherjee").setValue("KushalMu")
        
        
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        

        feedItemsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        self.view.addSubview(feedItemsCollectionView)
        feedItemsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            feedItemsCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            feedItemsCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            feedItemsCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            feedItemsCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        feedItemsCollectionView.register(FeedItemViewCell.self, forCellWithReuseIdentifier: "reuseidentifier")
        feedItemsCollectionView.backgroundColor = .systemBackground
        feedItemsCollectionView.dataSource = self
        feedItemsCollectionView.delegate = self
                
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseidentifier", for: indexPath) as! FeedItemViewCell
        cell.updateConstraints()
        
        cell.headerTitleLabel.text = feedItems[indexPath.row].userName
        cell.headerSubTitleLabel.text = feedItems[indexPath.row].headerSubtitle
        cell.headerImageView.image = UIImage(named: "profilepic")
        
        
        let attributedUsername = NSMutableAttributedString(string: feedItems[indexPath.row].userName, attributes: [.font:UIFont.boldSystemFont(ofSize: 15)])
        let attributedPostDescription = NSAttributedString(string: " "+feedItems[indexPath.row].postDescription)
        attributedUsername.append(attributedPostDescription)
        
        cell.descriptionLabel.attributedText = attributedUsername
        cell.mediaImageView.downloadImage(urlImgString: feedItems[indexPath.row].postMediaUrlString )
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.view.frame.width
        return CGSize(width: width, height: width)
        
        
    }
    
    
}
