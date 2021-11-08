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
    @AppStorage("originLangName") var originLangName: String?
    @AppStorage("destLangCode") var destLangCode: String?
    @AppStorage("destLangName") var destLangName: String?
    // TODOs: - Assign system language to origin button text

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
