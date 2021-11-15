//
//  TranslateinApp.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 27/10/21.
//

import SwiftUI

@main
struct TranslateinApp: App {
    @AppStorage("isFirstLaunch") var isFirstLaunch = true
    @AppStorage("leftLangCode") var leftCountryCode: String = "id"
    @AppStorage("leftLangName") var leftCountryNameButton: String = "Indonesia"
    @AppStorage("leftLangImage") var leftCountryImageName: String = "id"

    init() {
        if isFirstLaunch {
            let locale = Locale.current

            if let languageName = locale.localizedString(forLanguageCode: locale.languageCode ?? "en") {
                leftCountryNameButton = languageName
            }

            leftCountryCode = locale.languageCode ?? "en"
            leftCountryImageName = ImageEnum(rawValue: leftCountryCode)?.getCountryImage() ?? leftCountryCode
            isFirstLaunch = false
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
