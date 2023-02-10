//
//  LandmarkDetailsViewController.swift
//  Landmark - UICollectionView Project
//
//  Created by Arif Ashraf on 28/09/21.
//

import UIKit
import MapKit

class LandmarkDetailsViewController: UIViewController {

  @IBOutlet weak var mapView: MKMapView!

  @IBOutlet weak var landmarkImage: UIImageView!

  @IBOutlet weak var landmarkName: UILabel!
  @IBOutlet weak var landmarkPark: UILabel!
  @IBOutlet weak var landmarkState: UILabel!
  
  var landmarkNameTitle: String = ""
  var landmarkImageTitle: String = ""
  var landmarkParkTitle: String = ""
  var landmarkStateTitle: String = ""
  var landmarkLongitudeTitle: Double = 0
  var landmarkLatitudeTitle: Double = 0

  override func viewDidLoad() {
        super.viewDidLoad()

    landmarkName.text = landmarkNameTitle
    landmarkImage.image = UIImage(named: landmarkImageTitle)
    landmarkPark.text = landmarkParkTitle
    landmarkState.text = landmarkStateTitle

    landmarkImage.layer.cornerRadius = landmarkImage.frame.size.height / 2

    //Map Location:-
    let landmarkCoordinates = CLLocation(latitude: landmarkLatitudeTitle, longitude: landmarkLongitudeTitle)
    let regionRadius: CLLocationDistance = 1000.0
    let region = MKCoordinateRegion(center: landmarkCoordinates.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
    mapView.setRegion(region, animated: true)
    self.mapView.delegate = self

    }



}

extension LandmarkDetailsViewController: MKMapViewDelegate {

  func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
    print("Rendering...")
  }
}

