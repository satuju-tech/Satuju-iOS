//
//  LanguageSettingViewModel.swift
//  Satuju
//
//  Created by Gede Wicaksana on 06/11/21.
//

import SwiftUI

final class LanguageSettingViewModel: ObservableObject {
    @AppStorage("leftLangCode") var leftCountryCode: String = "id"
    @AppStorage("leftLangName") var leftCountryNameButton: String = "Indonesia"
    @AppStorage("leftLangImage") var leftCountryImageName: String = "id"
    @AppStorage("rightLangCode") var rightCountryCode: String = "en"
    @AppStorage("rightLangName") var rightCountryNameButton: String = "English"
    @AppStorage("rightLangImage") var rightCountryImageName: String = "en"

    @Published var leftColorNameButton = "PurplePrimary"
    @Published var rightColorNameButton = "AquaSecondary"

    func switchButton() {
        let tempLanguageCode = leftCountryCode
        let tempLanguageName = leftCountryNameButton
        let tempLanguageImage = leftCountryImageName
        leftCountryCode = rightCountryCode
        leftCountryNameButton = rightCountryNameButton
        leftCountryImageName = rightCountryImageName
        rightCountryCode = tempLanguageCode
        rightCountryNameButton = tempLanguageName
        rightCountryImageName = tempLanguageImage
    }
}
