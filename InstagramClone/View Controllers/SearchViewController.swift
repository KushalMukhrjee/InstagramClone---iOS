//
//  SearchViewController.swift
//  InstagramClone
//
//  Created by ndVOR on 05/03/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import UIKit



var categories = ["IGTV", "Shop", "TV & Movies", "Travel", "Style", "Gaming", "Auto", "Food", "Science & Tech", "Nature", "Comics", "Animals", "Music", "Sports"]

class SearchViewController: UIViewController {
    
    
//    var searchController: UISearchController!
    
    
    
    var searchCategoriesCollectionView = { () -> UICollectionView in
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.estimatedItemSize = CGSize(width: 70, height: 30)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: "reuse")
        
        return collectionView
        
    }()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        
        searchCategoriesCollectionView.dataSource = self
        searchCategoriesCollectionView.delegate = self
        
        self.navigationController?.navigationBar.addSubview(searchCategoriesCollectionView)
        
        NSLayoutConstraint.activate([

            searchCategoriesCollectionView.leadingAnchor.constraint(equalTo: self.navigationController!.navigationBar.leadingAnchor, constant: 15),
            searchCategoriesCollectionView.trailingAnchor.constraint(equalTo: self.navigationController!.navigationBar.trailingAnchor, constant: -15),
            searchCategoriesCollectionView.bottomAnchor.constraint(equalTo: self.navigationController!.navigationBar.bottomAnchor, constant: -5),
            searchCategoriesCollectionView.heightAnchor.constraint(equalToConstant: 40),


        ])
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
         if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            UINavigationController().navigationBar.standardAppearance = navBarAppearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
        
        self.navigationItem.titleView = searchController.searchBar
        let directBarButtonItem = UIBarButtonItem(image: UIImage(named: Constants.directImageName), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = directBarButtonItem
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    
}

extension SearchViewController: UISearchResultsUpdating, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = searchCategoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "reuse", for: indexPath) as! CategoriesCollectionViewCell
        cell.categoryTitleLabel.text = categories[indexPath.row]
//        cell.updateConstraints()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 70, height: 30)
        
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
    
    
}


class CategoriesCollectionViewCell: UICollectionViewCell {
    
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
