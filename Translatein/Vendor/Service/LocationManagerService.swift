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
    @AppStorage("rightLangImage") var rightCountryImageName: String?
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
                self.rightCountryName = LocationEnum(rawValue: country)?.getLanguageName() ?? "English"
                self.rightCountryCode = LocationEnum(rawValue: country)?.getCountryID() ?? "en"
                self.rightCountryImageName = LocationEnum(rawValue: country)?.getCountryID() ?? "en"
            }
        })
    }
}
