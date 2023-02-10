//
//  FeaturedView.swift
//  Landmark - UICollectionView Project
//
//  Created by Pawan Sharma on 23/09/21.
//

import UIKit

final class FeaturedView: UICollectionReusableView {
    
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "chilkoottrail")
        return iv
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
      imageView.layer.masksToBounds = true
      imageView.layer.cornerRadius = 10

        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 7).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -7).isActive = true
      imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
