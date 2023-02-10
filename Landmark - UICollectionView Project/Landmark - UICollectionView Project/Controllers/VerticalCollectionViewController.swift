import UIKit
import Foundation

final class VerticalCollectionViewController: UIViewController {
    @IBOutlet weak var verticalCollectionView: UICollectionView!
    var landmarks = [
        LandmarkModel(
            category: "Lakes",
            name: [],
            imageName: []
        ),
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

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Featured"
        self.verticalCollectionView.delegate = self
        self.verticalCollectionView.dataSource = self
        self.verticalCollectionView.register(
            VerticalHeaderCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "VerticalHeaderCollectionReusableView"
        )
        self.verticalCollectionView.register(
            VerticalFooterCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: "VerticalFooterCollectionReusableView"
        )
        self.verticalCollectionView.register(
            FeaturedView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "FeaturedView"
        )
      

    }
}

extension VerticalCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: self.verticalCollectionView.frame.width, height: 300)
        }
      return CGSize(width: self.verticalCollectionView.frame.width, height: 50)
    }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    if section == 3 {
      return CGSize(width: self.verticalCollectionView.frame.width, height: 50)
    }
    return CGSize(width: self.verticalCollectionView.frame.width, height: 0)
  }

    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            if kind == UICollectionView.elementKindSectionHeader {
                let featuredViewHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FeaturedView", for: indexPath)
                return featuredViewHeader
            } else {
                return UICollectionReusableView()
            }
        case 1...2:
            if kind == UICollectionView.elementKindSectionHeader {
                let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "VerticalHeaderCollectionReusableView", for: indexPath) as! VerticalHeaderCollectionReusableView
                sectionHeader.label.text = landmarks[indexPath.section].category
                return sectionHeader
            } else {
                return UICollectionReusableView()
            }
        case 3:
          if kind == UICollectionView.elementKindSectionHeader {
              let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "VerticalHeaderCollectionReusableView", for: indexPath) as! VerticalHeaderCollectionReusableView
              sectionHeader.label.text = landmarks[indexPath.section].category
              return sectionHeader
          } else if kind == UICollectionView.elementKindSectionFooter {
              let sectionFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "VerticalFooterCollectionReusableView", for: indexPath) as! VerticalFooterCollectionReusableView

              sectionFooter.onTap = {
               if let vc1 = self.storyboard?.instantiateViewController(identifier: "SeeAllLandmarkViewController") as? SeeAllLandmarkViewController {
                self.navigationController?.pushViewController(vc1,
                                                              animated: true)
                }
              }
            return sectionFooter
          } else {
            return UICollectionReusableView()
          }
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        section == 0 ? 0 : 1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = verticalCollectionView.dequeueReusableCell(
            withReuseIdentifier: "VerticalCollectionViewCell",
            for: indexPath
        ) as? VerticalCollectionViewCell else { return UICollectionViewCell() }

      cell.horizontalCollectionView.tag = indexPath.section

      //MARK:- Closure Implementation
      cell.onLandmarkSelection = { [weak self] landmark, name, image, park, state, latitude, longitude in
        print("Landmark Selected", name)
        if let vc2 = self?.storyboard?.instantiateViewController(identifier: "LandmarkDetailsViewController") as? LandmarkDetailsViewController {

          vc2.landmarkNameTitle = name
          vc2.landmarkImageTitle = image
          vc2.landmarkParkTitle = park
          vc2.landmarkStateTitle = state
          vc2.landmarkLongitudeTitle = longitude
          vc2.landmarkLatitudeTitle = latitude
          

          self?.navigationController?.pushViewController(vc2, animated: true)
        }
      }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return landmarks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.verticalCollectionView.frame.width, height: 200)
    }

  
}

