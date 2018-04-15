//
//  FeaturedViewController.swift
//  dscvr
//
//  Created by Jake Goodman on 4/13/18.
//  Copyright © 2018 Jake Martin. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    fileprivate enum Constants {
        static let featuredHeaderHeight: CGFloat = 50.0
        static let featuredHeaderFont: UIFont = UIFont(name: "norwester", size: 22.0)!

        static let featuredLabelInsets: UIEdgeInsets = UIEdgeInsetsMake(8, 8, 8, 8)
        static let backgroundColor: UIColor = UIColor(r: 57, g: 84, b: 98, a: 1)
        static let featuredHeight: CGFloat = (9 * UIScreen.main.bounds.width)/16.0
        static let featuredViewHeight: CGFloat = Constants.featuredHeaderHeight + Constants.featuredHeight + 16.0

    }
    
    //UI
    let featuredView: UIView
    let featuredHeaderLabel: UILabel
    let featuredCollectionView: UICollectionView
    let featuredPageControl: UIPageControl
    
    //Content
    var featuredCoverImages: [UIImage] = [#imageLiteral(resourceName: "Feature0"), #imageLiteral(resourceName: "Feature1"), #imageLiteral(resourceName: "Feature2")]
    
    init() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        
        featuredView = UIView()
        featuredCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        featuredHeaderLabel = UILabel()
        featuredPageControl = UIPageControl()
        
        super.init(nibName: nil, bundle: nil)
        
        let featuredStackView = UIStackView(arrangedSubviews: [featuredHeaderLabel, featuredCollectionView])
        featuredStackView.axis = .vertical
        
        view.addSubview(featuredView)
        featuredView.addSubview(featuredStackView)
        view.addSubview(featuredPageControl)

        
        featuredView.translatesAutoresizingMaskIntoConstraints = false
        featuredView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        featuredView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        featuredView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        featuredView.heightAnchor.constraint(equalToConstant: Constants.featuredViewHeight).isActive = true
        
        featuredStackView.translatesAutoresizingMaskIntoConstraints = false
        featuredStackView.topAnchor.constraint(equalTo: featuredView.topAnchor, constant: Constants.featuredLabelInsets.top).isActive = true
        featuredStackView.leftAnchor.constraint(equalTo: featuredView.leftAnchor).isActive = true
        featuredStackView.rightAnchor.constraint(equalTo: featuredView.rightAnchor).isActive = true
        featuredStackView.bottomAnchor.constraint(equalTo: featuredView.bottomAnchor, constant: -8.0).isActive = true
        featuredStackView.spacing = 8.0

        featuredCollectionView.register(FeaturedCollectionViewCell.self, forCellWithReuseIdentifier: "featuredCollectionCell")
        featuredCollectionView.dataSource = self
        featuredCollectionView.delegate = self

        featuredPageControl.translatesAutoresizingMaskIntoConstraints = false
        featuredPageControl.bottomAnchor.constraint(equalTo: featuredCollectionView.bottomAnchor).isActive = true
        featuredPageControl.centerXAnchor.constraint(equalTo: featuredCollectionView.centerXAnchor).isActive = true
        
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = Constants.backgroundColor
        featuredView.backgroundColor = UIColor.black.withAlphaComponent(0.20)

        featuredHeaderLabel.font = Constants.featuredHeaderFont
        featuredHeaderLabel.textColor = .white
        featuredHeaderLabel.text = " In the Spotlight"
        
        featuredCollectionView.isPagingEnabled = true
        featuredCollectionView.showsHorizontalScrollIndicator = false
        featuredCollectionView.backgroundColor = UIColor.black.withAlphaComponent(0.2)

        featuredPageControl.numberOfPages = featuredCoverImages.count

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FeaturedViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == featuredCollectionView {
            return featuredCoverImages.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == featuredCollectionView, let featuredCell = collectionView.dequeueReusableCell(withReuseIdentifier: "featuredCollectionCell", for: indexPath as IndexPath) as? FeaturedCollectionViewCell {
            featuredCell.imageView.image = featuredCoverImages[indexPath.row]
            return featuredCell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        featuredPageControl.currentPage = Int(ceil(x/w))
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        featuredPageControl.currentPage = Int(ceil(x/w))
    }
}
