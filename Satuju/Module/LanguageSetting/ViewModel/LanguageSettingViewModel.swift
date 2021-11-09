//
//  LanguageSettingViewModel.swift
//  Satuju
//
//  Created by Gede Wicaksana on 06/11/21.
//

import SwiftUI

final class LanguageSettingViewModel: ObservableObject {
    @AppStorage("originLangCode") var countryCodeOrigin: String = "id"
    @AppStorage("originLangName") var countryNameButtonOrigin: String = "Indonesia"
    @AppStorage("destLangCode") var countryCodeDestination: String = "en"
    @AppStorage("destLangName") var countryNameButtonDestination: String = "English"
    @Published var imageNameButtonOrigin = "INA"
    @Published var colorNameButtonOrigin = "PurplePrimary"
    @Published var imageNameButtonDestination = "UK"
    @Published var colorNameButtonDestination = "AquaSecondary"
}
