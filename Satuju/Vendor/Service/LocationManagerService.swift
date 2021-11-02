//
//  LocationManager.swift
//  Satuju
//
//  Created by Gede Wicaksana on 01/11/21.
//

import CoreLocation

final class LocationManagerService: NSObject, CLLocationManagerDelegate, ObservableObject {
    private let manager = CLLocationManager()
    @Published var state = ""
    @Published var country = ""
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            convertLatLongToAddress(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude)
        }
    }
    func convertLatLongToAddress(latitude: Double, longitude: Double) {
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: latitude, longitude: longitude)
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            // State
            if let state = placeMark.administrativeArea {
                self.state = state
            }
            // Country
            if let country = placeMark.country {
                self.country = country
            }
        })
    }
}
