//
//  FeaturedCollectionViewCell.swift
//  dscvr
//
//  Created by Jake Goodman on 4/14/18.
//  Copyright © 2018 Jake Martin. All rights reserved.
//

import UIKit

class FeaturedCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView
    
    override init(frame: CGRect) {
        imageView = UIImageView()
        super.init(frame: frame)
        
        let topLine = UIView()
        let bottomLine = UIView()
        
        let stackView = UIStackView(arrangedSubviews: [topLine, imageView, bottomLine])
        stackView.axis = .vertical
        contentView.addSubview(stackView)
        
        topLine.backgroundColor = .white
        topLine.translatesAutoresizingMaskIntoConstraints = false
        topLine.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        bottomLine.backgroundColor = .white
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true

        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
