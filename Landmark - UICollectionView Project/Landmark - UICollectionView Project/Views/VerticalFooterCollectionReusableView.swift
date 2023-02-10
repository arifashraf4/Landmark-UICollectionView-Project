//
//  VerticalFooterCollectionReusableView.swift
//  Landmark - UICollectionView Project
//
//  Created by Arif Ashraf on 24/09/21.
//

import UIKit

class VerticalFooterCollectionReusableView: UICollectionReusableView {

  var seeAllButton: UIButton = {
    let button = UIButton(type: .system)
//    label.textColor = .black
//    seeAllButton.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    button.setTitle("See all", for: .normal)
    button.backgroundColor = .systemBackground
    button.sizeToFit()
    return button
  }()

  var onTap: (() -> Void)?

  override init(frame: CGRect) {
    super.init(frame: frame)

    seeAllButton.layer.masksToBounds = true
    seeAllButton.layer.cornerRadius = 10

    addSubview(seeAllButton)

    seeAllButton.translatesAutoresizingMaskIntoConstraints = false
    seeAllButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
    seeAllButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 7).isActive = true
    seeAllButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -7).isActive = true
    seeAllButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

    seeAllButton.addTarget(self, action: #selector(self.seeAllButtonTap), for: .touchUpInside)
  }

  @objc private func seeAllButtonTap() {
    self.onTap?()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
