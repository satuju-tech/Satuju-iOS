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
    @AppStorage("originLangCode") var originLangCode: String?
    @AppStorage("destLangCode") var destLangCode: String?

    init() {
        if isFirstLaunch {
            originLangCode = Locale.current.languageCode
            isFirstLaunch = false
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
