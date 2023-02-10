//
//  SeeAllLandmarkViewController.swift
//  Landmark - UICollectionView Project
//
//  Created by Arif Ashraf on 26/09/21.
//

import UIKit

class SeeAllLandmarkViewController: UIViewController {

  @IBOutlet weak var landmarkTableView: UITableView!

  var landmarks =   [LandmarkModel(
                    category: "",
                    name: ["Silver Salmon Creek","St. Mary Lake","Twin Lake","Rainbow Lake","Hidden Lake","Lake Umbagog","Chilkoot Trail","Lake McDonald","Icy Bay","Turtle Rock","Charley Rivers","Chincoteague"],
                    imageName: ["silversalmoncreek","stmarylake","twinlake","rainbowlake","hiddenlake","umbagog","chilkoottrail","lakemcdonald","icybay","turtlerock","charleyrivers","chincoteague"])
  ]

  var landmarkLocations = [LandmarkLocationModel(
                            park: ["Lake Clark National Park and Preserve","Glacier National Park","Lake Clark National Park and Preserve","State Recreation Area","North Cascades National Park","Umbagog National Wildlife Refuge","Klondike Gold Rush National Historical Park","Glacier National Park","Wrangell-St. Elias National Park and Preserve","Joshua Tree National Park","Charley Rivers National Preserve","Chincoteague National Wildlife Refuge"],
                            state: ["Alaska","Montana","Alaska","Alaska","Washington","New Hampshire","Alaska","Montana","Alaska","Joshua Tree National Park","Charley Rivers National Preserve","Chincoteague National Wildlife Refuge"],
                            latitude: [59.980167,48.69423,60.641684,61.694334,48.495442,44.747408,59.560551,48.56002,60.089917,34.011286,65.350021,37.91531],
                            longitude: [-152.665167,-113.536248,-153.849883,-150.086103,-121.17799,-71.056816,-135.334571,-113.934831,-141.518167,-116.166868,-143.122586,-75.383212])
  ]


    override func viewDidLoad() {
        super.viewDidLoad()
      navigationController?.isNavigationBarHidden = false
      navigationController?.navigationBar.prefersLargeTitles = true
      navigationItem.title = "See all"

      self.landmarkTableView.delegate = self
      self.landmarkTableView.dataSource = self

      self.landmarkTableView.register(UINib(nibName: "LandmarkTableViewCell", bundle: nil), forCellReuseIdentifier: "LandmarkTableViewCell")
    }

}

extension SeeAllLandmarkViewController: UITableViewDelegate, UITableViewDataSource {



  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return landmarks[landmarkTableView.tag].name.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    guard let landmarkCell = self.landmarkTableView.dequeueReusableCell(withIdentifier: "LandmarkTableViewCell") as? LandmarkTableViewCell  else {
        return UITableViewCell()
    }
    let landmark = landmarks[indexPath.section]

    landmarkCell.landmarkImageTV.image = UIImage(named: landmark.imageName[indexPath.row])
    landmarkCell.landmarkNameTV.text = landmark.name[indexPath.row]

    return landmarkCell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(indexPath.row)

    if let vc2 = self.storyboard?.instantiateViewController(identifier: "LandmarkDetailsViewController") as? LandmarkDetailsViewController {
      let landmark = landmarks[indexPath.section]
      let landmarkLocation = landmarkLocations[indexPath.section]
      vc2.landmarkNameTitle = landmark.name[indexPath.row]
      vc2.landmarkImageTitle = landmark.imageName[indexPath.row]
      vc2.landmarkParkTitle = landmarkLocation.park[indexPath.row]
      vc2.landmarkStateTitle = landmarkLocation.state[indexPath.row]
      vc2.landmarkLongitudeTitle = landmarkLocation.longitude[indexPath.row]
      vc2.landmarkLatitudeTitle = landmarkLocation.latitude[indexPath.row]

      self.navigationController?.pushViewController(vc2, animated: true)
    }
  }


}
