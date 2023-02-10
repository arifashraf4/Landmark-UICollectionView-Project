//
//  HorizontalCollectionViewCell.swift
//  Landmark - UICollectionView Project
//
//  Created by Arif Ashraf on 20/09/21.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var horizontalImage: UIImageView!
  @IBOutlet weak var horizontalLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()

    horizontalImage.layer.cornerRadius = horizontalImage.frame.size.height / 10
  }
}
