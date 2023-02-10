//
//  VerticalHeaderCollectionReusableView.swift
//  Landmark - UICollectionView Project
//
//  Created by Arif Ashraf on 16/09/21.
//

import UIKit

class VerticalHeaderCollectionReusableView: UICollectionReusableView {

  var reusableHeader: UICollectionReusableView = {
    let reusableHeader: UICollectionReusableView = UICollectionReusableView()
    reusableHeader.backgroundColor = .systemBackground
    reusableHeader.sizeToFit()
    return reusableHeader
  }()

  var label: UILabel = {
    let label: UILabel = UILabel()
//    label.textColor =
    label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    label.backgroundColor = .systemBackground
    label.sizeToFit()
    return label
  }()

//  var headerView = VerticalHeaderCollectionReusableView()

  override init(frame: CGRect) {
    super.init(frame: frame)

    label.layer.masksToBounds = true
    label.layer.cornerRadius = 10

    reusableHeader.layer.masksToBounds = true
    reusableHeader.layer.cornerRadius = 10

addSubview(reusableHeader)
    addSubview(label)

    reusableHeader.translatesAutoresizingMaskIntoConstraints = false
    reusableHeader.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    reusableHeader.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 7).isActive = true
    reusableHeader.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
    reusableHeader.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -7).isActive = true

    label.translatesAutoresizingMaskIntoConstraints = false
    label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    label.leftAnchor.constraint(equalTo: reusableHeader.leftAnchor, constant: 20).isActive = true
    label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
    label.rightAnchor.constraint(equalTo: reusableHeader.rightAnchor,constant: -20).isActive = true
  }



  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
