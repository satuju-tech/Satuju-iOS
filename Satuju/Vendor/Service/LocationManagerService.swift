//
//  LocationManagerService.swift
//  Satuju
//
//  Created by Gede Wicaksana on 06/11/21.
//
import CoreLocation
import SwiftUI

final class LocationManagerService: NSObject, CLLocationManagerDelegate, ObservableObject {

    @AppStorage("rightLangName") var rightCountryName: String?
    @AppStorage("rightLangCode") var rightCountryCode: String?

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
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, _) -> Void in
            if let placeMark: CLPlacemark = placemarks?[0] {
                if let country = placeMark.country {
                    self.rightCountryName = LocationEnum(rawValue: country)?.getLanguageName()
                    self.rightCountryCode = LocationEnum(rawValue: country)?.getCountryID()
                }
            } else {
                self.rightCountryName = "English"
                self.rightCountryCode = "en"
            }
        })
    }
}
