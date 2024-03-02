//
//  DeliveryViewController.swift
//  LatteNewLaunch
//
//  Created by Радмир Тельман on 21.12.2023.
//

import UIKit
import SnapKit
import MapKit

final class DeliveryViewController: UIViewController {
    
    var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
         super.viewDidLoad()
         mapView = MKMapView()
         view.addSubview(mapView)
         mapView.snp.makeConstraints { make in
             make.edges.equalToSuperview()
         }
         mapView.showsUserLocation = true
         mapView.userTrackingMode = .follow // Эта настройка позволяет карте следить за местоположением пользователя
         locationManager.delegate = self
         locationManager.requestWhenInUseAuthorization()
         locationManager.desiredAccuracy = kCLLocationAccuracyBest
         locationManager.startUpdatingLocation()
     }
}

extension DeliveryViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last, location.horizontalAccuracy < 100 {
            locationManager.stopUpdatingLocation()
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        mapView.setRegion(region, animated: true)
        }
    }
}
