//
//  LanguageSettingViewModel.swift
//  Satuju
//
//  Created by Gede Wicaksana on 06/11/21.
//

import SwiftUI

final class LanguageSettingViewModel: ObservableObject {
    @Published var imageNameButtonOrigin = "INA"
    @Published var countryNameButtonOrigin = "Indonesia"
    @Published var colorNameButtonOrigin = "PurplePrimary"
    @Published var imageNameButtonDestination = "UK"
    @Published var countryNameButtonDestination = "England"
    @Published var colorNameButtonDestination = "AquaSecondary"
    func changeLanguageButtonOrigin() {
        imageNameButtonOrigin = "UK"
        countryNameButtonOrigin = "England"
    }
    func changeLanguageButtonDestination() {
        imageNameButtonDestination = "INA"
        countryNameButtonDestination = "Indonesia"
    }
    func changeButtonDestinationBasedOnLocation(countryName: String) {
        imageNameButtonDestination = "INA"
        countryNameButtonDestination = countryName
    }
    func switchButton() {
        let countryNameTempOrigin = countryNameButtonOrigin
        let imageNameTempOrigin = imageNameButtonOrigin
        countryNameButtonOrigin = countryNameButtonDestination
        imageNameButtonOrigin = imageNameButtonDestination
        countryNameButtonDestination = countryNameTempOrigin
        imageNameButtonDestination = imageNameTempOrigin
    }
}
