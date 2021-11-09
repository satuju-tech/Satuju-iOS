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
    @AppStorage("originLangImage") var countryImageOrigin: String = "all"
    @AppStorage("destLangCode") var countryCodeDestination: String = "en"
    @AppStorage("destLangName") var countryNameButtonDestination: String = "English"
    @AppStorage("destLangImage") var countryImageDestination: String = "all"
    @Published var colorNameButtonOrigin = "PurplePrimary"
    @Published var colorNameButtonDestination = "AquaSecondary"
}
