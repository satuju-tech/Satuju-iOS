//
//  LocationManagerService.swift
//  Satuju
//
//  Created by Gede Wicaksana on 06/11/21.
//
import CoreLocation
import SwiftUI

final class LocationManagerService: NSObject, CLLocationManagerDelegate, ObservableObject {
    @AppStorage("destLangName") var countryNameDestination: String?
    @AppStorage("destLangCode") var countryCodeDestination: String?
    private let manager = CLLocationManager()
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
            // Country
            if let country = placeMark.country {
                self.countryNameDestination = LocationEnum(rawValue: country)?.getCountryName() ?? "English"
                self.countryCodeDestination = LocationEnum(rawValue: country)?.getCountryID() ?? "en"
            }
        })
    }
}
