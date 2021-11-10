//
//  SatujuApp.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 27/10/21.
//

import SwiftUI

@main
struct SatujuApp: App {
    @AppStorage("isFirstLaunch") var isFirstLaunch = true
    @AppStorage("leftLangCode") var leftLangCode: String?
    @AppStorage("rightLangCode") var rightLangCode: String?

    init() {
        if isFirstLaunch {
            let locale = Locale.current

            if let languageName = locale.localizedString(forLanguageCode: locale.languageCode ?? "en") {
                leftLangCode = languageName
            }

            leftLangCode = locale.languageCode
            isFirstLaunch = false
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
