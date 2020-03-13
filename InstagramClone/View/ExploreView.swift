//
//  ExploreView.swift
//  InstagramClone
//
//  Created by Kushal Mukherjee on 12/03/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import UIKit

class ExploreView: UIView {
    
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = CGSize(width: 50, height: 50)
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        flowLayout.minimumInteritemSpacing = 2
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        self.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ExploreCollectionViewCell.self, forCellWithReuseIdentifier: Constants.exploreCollectionViewReuseIdentifier)
        
        collectionView.pinToEdges(of: self, toSafeArea: true)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }

}
