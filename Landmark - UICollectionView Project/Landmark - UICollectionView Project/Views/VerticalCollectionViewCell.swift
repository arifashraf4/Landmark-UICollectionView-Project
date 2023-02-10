//
//  VerticalCollectionViewCell.swift
//  Landmark - UICollectionView Project
//
//  Created by Arif Ashraf on 16/09/21.
//

import UIKit

class VerticalCollectionViewCell: UICollectionViewCell {

  //MARK: Declaring a closure
  var onLandmarkSelection: ((LandmarkModel, String, String, String, String, Double, Double) -> Void)?

  @IBOutlet weak var horizontalCollectionView: UICollectionView!

  var landmarks =   [LandmarkModel(
                    category: "Lakes",
                    name: [],
                    imageName: []),

                    LandmarkModel(
                    category: "Lakes",
                    name: ["Silver Salmon Creek","St. Mary Lake","Twin Lake","Rainbow Lake","Hidden Lake","Lake Umbagog"],
                    imageName: ["silversalmoncreek","stmarylake","twinlake","rainbowlake","hiddenlake","umbagog"]),
                   
                   LandmarkModel(
                    category: "Mountains",
                    name: ["Chilkoot Trail","Lake McDonald","Icy Bay"],
                    imageName: ["chilkoottrail","lakemcdonald","icybay"]),
                   
                   LandmarkModel(
                    category: "Rivers",
                    name: ["Turtle Rock","Charley Rivers","Chincoteague"],
                    imageName: ["turtlerock","charleyrivers","chincoteague"])
  ]

  var landmarkLocation = [LandmarkLocationModel(
                            park: [],
                            state: [],
                            latitude: [],
                            longitude: []),

                          LandmarkLocationModel(
                            park: ["Lake Clark National Park and Preserve","Glacier National Park","Lake Clark National Park and Preserve","State Recreation Area","North Cascades National Park","Umbagog National Wildlife Refuge"],
                            state: ["Alaska","Montana","Alaska","Alaska","Washington","New Hampshire"],
                            latitude: [59.980167,48.69423,60.641684,61.694334,48.495442,44.747408],
                            longitude: [-152.665167,-113.536248,-153.849883,-150.086103,-121.17799,-71.056816]),

                          LandmarkLocationModel(
                            park: ["Klondike Gold Rush National Historical Park","Glacier National Park","Wrangell-St. Elias National Park and Preserve"],
                            state: ["Alaska","Montana","Alaska"],
                            latitude: [59.560551,48.56002,60.089917],
                            longitude: [-135.334571,-113.934831,-141.518167]),

                          LandmarkLocationModel(
                            park: ["Joshua Tree National Park","Charley Rivers National Preserve","Chincoteague National Wildlife Refuge"],
                            state: ["California","Alaska","Virginia"],
                            latitude: [34.011286,65.350021,37.91531],
                            longitude: [-116.166868,-143.122586,-75.383212])
  ]


  override func awakeFromNib() {
    super.awakeFromNib()
    self.horizontalCollectionView.delegate = self
    self.horizontalCollectionView.dataSource = self

    horizontalCollectionView.layer.cornerRadius = horizontalCollectionView.frame.size.height / 25

  }
  
}


extension VerticalCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return landmarks[horizontalCollectionView.tag].imageName.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = horizontalCollectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCollectionViewCell", for: indexPath) as? HorizontalCollectionViewCell else { return UICollectionViewCell() }
    
    cell.horizontalImage.image = UIImage(named: landmarks[horizontalCollectionView.tag].imageName[indexPath.item])
    cell.horizontalLabel.text = landmarks[horizontalCollectionView.tag].name[indexPath.item]

    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    print(landmarks[horizontalCollectionView.tag].name[indexPath.item])


    let selectedLandmark = landmarks[horizontalCollectionView.tag]
    let selectedLandmarkLocation = landmarkLocation[horizontalCollectionView.tag]

    let selectedLandmarkName = selectedLandmark.name[indexPath.item]
    let selectedLandmarkImage = selectedLandmark.imageName[indexPath.item]
    let selectedLandmarkPark = selectedLandmarkLocation.park[indexPath.item]
    let selectedLandmarkState = selectedLandmarkLocation.state[indexPath.item]
    let selectedLandmarkLongitude = selectedLandmarkLocation.longitude[indexPath.item]
    let selectedLandmarkLatitude = selectedLandmarkLocation.latitude[indexPath.item]
    // MARK:- Calling the closure
    self.onLandmarkSelection?(selectedLandmark, selectedLandmarkName, selectedLandmarkImage, selectedLandmarkPark, selectedLandmarkState, selectedLandmarkLatitude, selectedLandmarkLongitude)

    

  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (self.frame.size.width)
    return CGSize(width: width/2.1, height: 200)
  }

}


