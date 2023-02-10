//
//  LandmarkTableViewCell.swift
//  Landmark - UICollectionView Project
//
//  Created by Arif Ashraf on 27/09/21.
//

import UIKit

class LandmarkTableViewCell: UITableViewCell {


  @IBOutlet weak var landmarkImageTV: UIImageView!
  @IBOutlet weak var landmarkNameTV: UILabel!


  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    landmarkImageTV.layer.cornerRadius = landmarkImageTV.frame.size.height / 2

    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    
}
