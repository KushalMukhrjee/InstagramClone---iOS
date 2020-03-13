//
//  SearchViewController.swift
//  InstagramClone
//
//  Created by ndVOR on 05/03/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import UIKit


enum MediaTypes: Int {
    
    case image, story, video
    
}


var media = [MediaTypes]()

func randomlyStoreMedia() {
    
    for _ in 0...100 {
        let number = Int.random(in: 0...2)
        media.append(MediaTypes(rawValue: number)!)
    }
    
}


class ExploreViewController: UIViewController {
    
    
    var exploreView: ExploreView!
    
    
    
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
        
        collectionView.register(SearchCategoriesCollectionViewCell.self, forCellWithReuseIdentifier: Constants.searchCategoriesCollectionViewReuseIdentifier)
        
        return collectionView
        
    }()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomlyStoreMedia()
        
        
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
        
        
        
        exploreView = ExploreView()
        self.view.addSubview(exploreView)
        exploreView.translatesAutoresizingMaskIntoConstraints = false
        
        exploreView.pinToEdges(of: self.view, toSafeArea: true)
        exploreView.collectionView.dataSource = self
        exploreView.collectionView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    
    
}

extension ExploreViewController: UISearchResultsUpdating, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == searchCategoriesCollectionView {
            return Constants.exploreCategories.count
        } else if collectionView == exploreView.collectionView {
            return media.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == searchCategoriesCollectionView {
            
            let cell = searchCategoriesCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.searchCategoriesCollectionViewReuseIdentifier, for: indexPath) as! SearchCategoriesCollectionViewCell
            cell.categoryTitleLabel.text = Constants.exploreCategories[indexPath.row]
            return cell
            
        } else if collectionView == exploreView.collectionView {
            
            let cell = exploreView.collectionView.dequeueReusableCell(withReuseIdentifier: Constants.exploreCollectionViewReuseIdentifier, for: indexPath) as! ExploreCollectionViewCell
            cell.backgroundColor = .blue
            return cell
            
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == searchCategoriesCollectionView {
            return CGSize(width: 70, height: 30)
        } else if collectionView == exploreView.collectionView {
            
            let med = media[indexPath.row]
            
            var width = exploreView.collectionView.frame.width / 3 - 4 // based on edge insets and interitemspacing in explore view controller.
            var height = CGFloat()
            
            if med == MediaTypes.image {
                height = width
            } else if med == MediaTypes.story {
                height = 200
            } else {
                height = 100
            }
            
            
            
            
            
            
            
            return CGSize(width: width, height: height)
        }
        
        return CGSize()
        
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
    
    
}


